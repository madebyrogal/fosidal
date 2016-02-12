<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation\Request;

class WinnerController extends Controller
{
    /**
     * @Route("zwyciezcy.html", name="winner")
     * @Method({"GET","POST","HEAD"})
     */
    public function indexAction(Request $request)
    {
//        $surveyes = $this->getDoctrine()->getRepository('AdminBundle:Survey')->findActually();
//        if($request->getMethod() === Request::METHOD_POST){
//            $survey = $this->getDoctrine()->getRepository('AdminBundle:Survey')->find($request->get('quiz'));
//            if($request->get('award1')->isClicked()){
//                $results = $this->getDoctrine()->getRepository('AdminBundle:Result')->findBy(array('award1'=>true, 'survey'=>$survey));
//            } elseif($request->get('award2')->isClicked()){
//                $results = $this->getDoctrine()->getRepository('AdminBundle:Result')->findBy(array('award2'=>true, 'survey'=>$survey));
//            }
//        } else {
//            $results = $this->getDoctrine()->getRepository('AdminBundle:Result')->findBy(array('award1'=>true, 'survey'=>$surveyes[0]));
//        }
//        
//        return $this->render('AppBundle:Winner:index.html.twig', array('results'=>$results, 'surveyes'=>$surveyes));
        $results = array();
        return $this->render('AppBundle:Winner:index.html.twig', array('results'=>$results));
    }

}
