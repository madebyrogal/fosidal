<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class AwardController extends Controller
{
    /**
     * @Route("nagrody.html",  name="award")
     * @Method({"GET", "HEAD"})
     */
    public function indexAction()
    {
        return $this->render('AppBundle:Award:index.html.twig', array(
            // ...
        ));
    }

}
