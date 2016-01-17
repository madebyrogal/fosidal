<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class AboutController extends Controller
{
    /**
     * @Route("o_produkcie.html", name="about")
     * @Method({"GET","HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:About:index.html.twig', array(
            // ...
        ));
    }

}
