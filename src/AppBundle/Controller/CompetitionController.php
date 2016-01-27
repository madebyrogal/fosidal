<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use AdminBundle\Entity\Result;

/**
 * @Route("konkurs")
 */
class CompetitionController extends Controller
{

    /**
     * @Route("/slajd/{slideNr}.html", defaults={"slideNr" = 1}, name="competition", requirements={
     *     "page": "\d+"
     * })
     * @Method({"GET","POST","HEAD"})
     */
    public function indexAction($slideNr)
    {
        return $this->render('AppBundle:Competition:slide' . $slideNr . '.html.twig', array());
    }

    /**
     * @Route("/pytania.html", name="competitionQuestion")
     * @Method({"GET","POST","HEAD"})
     */
    public function questionAction()
    {
        $quiz = $this->get('app.quiz');
        $quiz->init();
        $survey = $quiz->getQuiz();
        if (!$survey) {
            throw $this->createNotFoundException('Sorry, there are no quiz');
        }
        $data = $quiz->getNextQuestion();

        return $this->render('AppBundle:Competition:question.html.twig', $this->prepareViewData($survey, $data->question, $quiz->getPoints(), $data->questionNr));
    }

    /**
     * @Route("/pytania-next.html", name="competitionNexQuestion")
     * @Method({"GET","POST","HEAD"})
     */
    public function nextQuestionAction()
    {
        $quiz = $this->get('app.quiz');
        $survey = $quiz->getQuiz();
        $data = $quiz->getNextQuestion();
        if (is_null($data->question)) {

            return $this->redirectToRoute('competitionEnd');
        }

        return $this->render('AppBundle:Competition:question.html.twig', $this->prepareViewData($survey, $data->question, $quiz->getPoints(), $data->questionNr));
    }

    /**
     * @Route("/formularz.html", name="competitionEnd")
     * @Method({"GET","POST","HEAD"})
     */
    public function endAction(Request $request)
    {
        $quiz = $this->get('app.quiz');
        if (!$quiz->validEnd()) {
            
            return $this->redirectToRoute('competitionQuestion');
        }
        $result = new Result();
        $form = $this->createForm('AdminBundle\Form\ResultType', $result, array('action' => $this->generateUrl('competitionEnd')));
        
        $this->mainpulateRequst($request);
        $form->handleRequest($request);
       
        if ($form->isSubmitted() && $form->isValid()) {
            $result->setSurvey($quiz->getQuiz());
            $em = $this->getDoctrine()->getManager();
            $em->persist($result);
            $em->flush();
            
            return $this->redirectToRoute('competitionThanks');
        }

        return $this->render('AppBundle:Competition:end.html.twig', array('form' => $form->createView()));
    }

    /**
     * @Route("/dziekujemy.html", name="competitionThanks")
     * @Method({"GET","POST","HEAD"})
     */
    public function saveQuizAction(Request $request)
    {
        $quiz = $this->get('app.quiz');
        if (!$quiz->validEnd() || empty($request->headers->get('referer'))) {
            
            return $this->redirectToRoute('competitionQuestion');
        }
        $quiz->close();
        
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
        if (!$quiz->valid($request->get('questionNr'))) {
            $data = array('url' => $this->generateUrl('competitionQuestion'));
            
            return new JsonResponse($data, JsonResponse::HTTP_GONE);
        }

        $answer = $quiz->getCorrectAnswer($request->get('questionNr'), $request->get('answerNr'), $request->get('timeLeft'));
        $data = array('answerId' => $answer->getId());
        
        return new JsonResponse($data, JsonResponse::HTTP_OK);
    }

    private function prepareViewData($quize, $question, $points = 0, $questionNr = 1)
    {
        $data = array(
            'quiz' => $quize,
            'question' => $question,
            'points' => $points,
            'questionNumber' => $questionNr,
            'token' => $this->get('form.csrf_provider')->generateCsrfToken('')
        );

        return $data;
    }
    
    private function mainpulateRequst(Request $request){
        if($request->request->get('result')){
            $result = $request->request->get('result');
            $session = $this->get('session');
            $sessionData = $session->get('quiz');
            //From session points and content
            $result['points'] = $sessionData['points'];
            $result['content'] = json_encode($sessionData['question']);
            //postCode
            $fakePostCode = $request->request->get('postCode');
            $result['postCode'] = $result['postCode'] . join('', $fakePostCode);
            $request->request->set('result', $result);
            //Clear request
            $request->request->remove('postCode');
        }
    }

}
