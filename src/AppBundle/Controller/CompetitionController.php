<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class CompetitionController extends Controller
{

    /**
     * @Route("/konkurs.html", name="competition")
     * @Method({"GET", "HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:Competition:index.html.twig', array());
    }

    /**
     * @Route("/konkurs/pytania.html", name="competitionQuestion")
     * @Method({"GET","POST","HEAD"})
     */
    public function questionAction()
    {
        $survey = $this->getDoctrine()->getRepository('AdminBundle:Survey')->findActive();
        if (!$survey) {

            throw $this->createNotFoundException('Sorry, there are no quiz');
        } 

        return $this->render('AppBundle:Competition:question.html.twig', array('quiz' => $survey));
    }

}
