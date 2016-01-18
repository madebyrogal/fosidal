<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class ContactController extends Controller
{
    /**
     * @Route("kontakt.html", name="contact")
     * @Method({"GET", "HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:Contact:index.html.twig', array(
            // ...
        ));
    }

}
