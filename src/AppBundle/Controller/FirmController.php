<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class FirmController extends Controller
{
    /**
     * @Route("o_firmie.html", name="firm")
     * @Method({"GET", "HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:Firm:index.html.twig', array(
            // ...
        ));
    }

}