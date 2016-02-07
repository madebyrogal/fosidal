<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class ResponsibilityController extends Controller
{

    /**
     * @Route("odpowiedzialnosc_spoleczna.html", name="responsibility")
     * @Method({"GET","POST","HEAD"})
     */
    public function indexAction()
    {
        $page = $this->getDoctrine()->getRepository('AdminBundle:Page')->findOneBy(array('hashname' => 'responsibility'));
        return $this->render('AppBundle:Responsibility:index.html.twig', array('page' => $page));
    }

}
