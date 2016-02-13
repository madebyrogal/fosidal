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
        $surveyes = $this->getDoctrine()->getRepository('AdminBundle:Survey')->findBy(array(), array('start' => 'ASC'));
        if($request->getMethod() === Request::METHOD_POST){
            $surveyActuall = $this->getDoctrine()->getRepository('AdminBundle:Survey')->find($request->get('quize'));
            if($request->get('award1')){
                $results = $this->getDoctrine()->getRepository('AdminBundle:Result')->findBy(array('award1'=>true, 'survey'=>$surveyActuall));
                $award = 1;
            } elseif($request->get('award2')){
                $results = $this->getDoctrine()->getRepository('AdminBundle:Result')->findBy(array('award2'=>true, 'survey'=>$surveyActuall));
                $award = 2;
            } else {
                $award = $request->request->get('award');
                $results = $this->getDoctrine()->getRepository('AdminBundle:Result')->findBy(array('award'.$award=>true, 'survey'=>$surveyActuall));
            }
        } else {
            //On get without post formular (initial data)
            $surveyActuall = $this->getDoctrine()->getRepository('AdminBundle:Survey')->findActive();
            $results = $this->getDoctrine()->getRepository('AdminBundle:Result')->findBy(array('award1'=>true, 'survey'=>$surveyActuall));
            $award = 1;
        }
        
        return $this->render('AppBundle:Winner:index.html.twig', array('results'=>$results, 'surveyes'=>$surveyes, 'award'=>$award, 'surveyActuall'=>$surveyActuall));
    }

}
