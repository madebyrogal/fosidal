<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class MainController extends Controller
{
    /**
     * @Route("/", name="home")
     * @Method({"GET","POST","HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:Main:index.html.twig', array(
            // ...
        ));
    }

}
