<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class ContactController extends Controller
{
    /**
     * @Route("kontakt.html", name="contact")
     * @Method({"GET","POST","HEAD"})
     */
    public function indexAction()
    {
        $page = $this->getDoctrine()->getRepository('AdminBundle:Page')->findOneBy(array('hashname' => 'contact'));
        return $this->render('AppBundle:Contact:index.html.twig', array('page' => $page));
    }

}
