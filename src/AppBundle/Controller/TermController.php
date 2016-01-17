<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class TermController extends Controller
{
    /**
     * @Route("regulamin.html", name="term")
     * @Method({"GET","HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:Term:index.html.twig', array(
            // ...
        ));
    }

}
