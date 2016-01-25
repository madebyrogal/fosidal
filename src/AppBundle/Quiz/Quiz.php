<?php

namespace AppBundle\Quiz;

use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\Session\Session;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Quiz
 *
 * @author rogal
 */
class Quiz
{

    private $quiz;
    private $session;
    private $em;

    public function __construct(EntityManager $entityManager, Session $session)
    {
        $this->em = $entityManager;
        $this->quiz = $this->em->getRepository('AdminBundle:Survey')->findActive();
        $this->session = $session;
    }

    private function prepareDataSession()
    {
        $data = array(
            'points' => 0,
            'question' => array()
        );

        return $data;
    }

    public function init()
    {
        $this->session->set('quiz', $this->prepareDataSession());
    }
    
    public function close(){
        $this->session->remove('quiz');
    }

    public function getQuiz()
    {
        return $this->quiz;
    }

    public function getFirstQuestion()
    {
        return $this->quiz->getQuestions()->first();
    }

    public function getNextQuestion()
    {
        $quizData = $this->session->get('quiz');
        $data = new \stdClass();
        $count = count($quizData['question']);
        $data->questionNr = $count + 1;
        $data->question = $this->quiz->getQuestions()[$count];

        return $data;
    }

    public function getCorrectAnswer($questionId, $answerId)
    {
        $question = $this->em->getRepository('AdminBundle:Question')->find($questionId);
        $answer = $question->getCorrectAnswer();
        $quizData = $this->session->get('quiz');
        if ($answer->getId() == $answerId) {
            $quizData['points'] += $question->getPoints();
            $quizData['question'][$question->getId()] = $question->getPoints();
        } else {
            $quizData['question'][$question->getId()] = 0;
        }
        $this->session->set('quiz', $quizData);

        return $answer;
    }

    public function valid($quesitonId)
    {
        $quize = $this->session->get('quiz');
        if(empty($quize)){
            return false;
        }
        //Dubel cofniecie pytani
        if(isset($quize['question'][$quesitonId])){
            
            return false;
        } else {
            return true;
        }
    }
    
    public function validEnd(){
        $quize = $this->session->get('quiz');
        if(count($quize['question']) === $this->quiz->getQuestions()->count()){
            return true;
        } else {
            return false;
        }
    }

}
