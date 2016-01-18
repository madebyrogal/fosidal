<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class NotificationController extends Controller
{
    /**
     * @Route("zglos_dzialania_nieporzadane.html", name="notification")
     * @Method({"GET", "HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:Notification:index.html.twig', array(
            // ...
        ));
    }

}
