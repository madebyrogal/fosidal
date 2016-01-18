<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class WinnerController extends Controller
{
    /**
     * @Route("zwyciezcy.html", name="winner")
     * @Method({"GET", "HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:Winner:index.html.twig', array(
            // ...
        ));
    }

}
