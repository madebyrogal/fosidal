<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

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
        $survey = $this->getDoctrine()->getRepository('AdminBundle:Survey')->findActive();
        $question = $survey->getQuestions()->first();
        if (!$survey) {

            throw $this->createNotFoundException('Sorry, there are no quiz');
        }

        return $this->render('AppBundle:Competition:question.html.twig', array(
                    'quiz' => $survey,
                    'question' => $question,
                    'questionNumber' => 1,
                    'token' => $this->get('form.csrf_provider')->generateCsrfToken(''))
        );
    }
    
    /**
     * @Route("/check-answer.html", name="competitionCheckAnswer")
     * @Method({"GET","HEAD"})
     */
    public function checkAnswerAction(Request $request){
        if($request->query->get('token') !== $this->get('form.csrf_provider')->generateCsrfToken('')) {
            return new JsonResponse($data, JsonResponse::HTTP_FORBIDDEN);
        }
        //TODO sprawdzic czy token zabezpiecza
        
        return new JsonResponse($data, JsonResponse::HTTP_OK);
    }

}
