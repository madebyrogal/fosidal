<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class FirmController extends Controller
{

    /**
     * @Route("o_firmie.html", name="firm")
     * @Method({"GET","POST","HEAD"})
     */
    public function indexAction()
    {
        $page = $this->getDoctrine()->getRepository('AdminBundle:Page')->findOneBy(array('hashname' => 'about'));
        return $this->render('AppBundle:Firm:index.html.twig', array('page' => $page));
    }

}
