<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use AppBundle\Quiz\Quiz;

/**
 * @Route("konkurs")
 */
class CompetitionController extends Controller
{

    /**
     * @Route("/slajd/{slideNr}.html", defaults={"slideNr" = 1}, name="competition", requirements={
     *     "page": "\d+"
     * })
     * @Method({"GET", "HEAD"})
     */
    public function indexAction($slideNr)
    {
        return $this->render('AppBundle:Competition:slide' . $slideNr . '.html.twig', array());
    }

    /**
     * @Route("/pytania.html", name="competitionQuestion")
     * @Method({"GET","HEAD"})
     */
    public function questionAction()
    {
        $quiz = $this->get('app.quiz');
        $quiz->init();
        $survey = $quiz->getQuiz();
       $data = $quiz->getNextQuestion();
        //dump($this->get('session')->get('quiz'));die
        if (!$survey) {
            throw $this->createNotFoundException('Sorry, there are no quiz');
        }

        return $this->render('AppBundle:Competition:question.html.twig', $this->prepareViewData($survey, $data->question, $data->questionNr));
    }

    /**
     * @Route("/pytania-next.html", name="competitionNexQuestion")
     * @Method({"GET","HEAD"})
     */
    public function nextQuestionAction()
    {
        $quiz = $this->get('app.quiz');
        $survey = $quiz->getQuiz();
        $data = $quiz->getNextQuestion();
        if(is_null($data->question)){
            
            return $this->redirectToRoute('competitionEnd');
        }
        
        return $this->render('AppBundle:Competition:question.html.twig', $this->prepareViewData($survey, $data->question, $data->questionNr));
    }
    
    /**
     * @Route("/formularz.html", name="competitionEnd")
     * @Method({"GET", "POST","HEAD"})
     */
    public function endAction()
    {
        $quiz = $this->get('app.quiz');
        if(!$quiz->validEnd()){
            return $this->redirectToRoute('competitionQuestion');
        }
        return $this->render('AppBundle:Competition:end.html.twig', array());
    }
    
    /**
     * @Route("/zapisz-wynik.html", name="competitionSave")
     * @Method({"POST", "HEAD"})
     */
    public function saveQuizAction(){
        return $this->render('AppBundle:Competition:thanksPage.html.twig', array());
    }

    /**
     * @Route("/check-answer.html", name="competitionCheckAnswer")
     * @Method({"POST","HEAD"})
     */
    public function checkAnswerAction(Request $request)
    {
        if ($request->request->get('token') !== $this->get('form.csrf_provider')->generateCsrfToken('')) {
            return new JsonResponse(null, JsonResponse::HTTP_FORBIDDEN);
        }
        $quiz = $this->get('app.quiz');
        if (!$quiz->valid($request->get('questionNr'))){
            $data = array('url' => $this->generateUrl('competitionQuestion'));
            return new JsonResponse($data, JsonResponse::HTTP_GONE);
        }
        
        $answer = $quiz->getCorrectAnswer($request->get('questionNr'), $request->get('answerNr'));
        $data = array('answerId' => $answer->getId());
        return new JsonResponse($data, JsonResponse::HTTP_OK);
    }

    private function prepareViewData($quize, $question, $questionNr = 1)
    {
        $data = array(
            'quiz' => $quize,
            'question' => $question,
            'questionNumber' => $questionNr,
            'token' => $this->get('form.csrf_provider')->generateCsrfToken('')
        );

        return $data;
    }

}
