<?php

namespace AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AdminBundle\Entity\Result;

/**
 * Result controller.
 *
 * @Route("/admin/result")
 */
class ResultController extends Controller
{

    /**
     * Lists all Result entities.
     *
     * @Route("/{quize}", name="admin_result_index")
     * @Method("GET")
     */
    public function indexAction($quize = 0)
    {
        $em = $this->getDoctrine()->getManager();

        if($quize) {
            $survey = $em->getRepository('AdminBundle:Survey')->find($quize);
        } else {
            $survey = $em->getRepository('AdminBundle:Survey')->findActive();
        }
        $surveys = $em->getRepository('AdminBundle:Survey')->findBy(array(), array('start'=>'ASC'));
        $results = $em->getRepository('AdminBundle:Result')->findBy(array('survey'=>$survey), array('survey'=>'ASC', 'points' => 'DESC', 'created' => 'ASC'));
        $awards1 = $em->getRepository('AdminBundle:Result')->findBy(array('award1'=> true, 'survey'=>$survey));
        $awards2 = $em->getRepository('AdminBundle:Result')->findBy(array('award2'=> true, 'survey'=>$survey));
        //dump($survey);die;
        return $this->render('result/index.html.twig', array(
                    'quize' => $survey,
                    'surveys' => $surveys,
                    'results' => $results,
                    'award1Count'=>count($awards1),
                    'award2Count'=>count($awards2)
        ));
    }

    /**
     * Finds and displays a Result entity.
     *
     * @Route("/{id}", name="admin_result_show")
     * @Method("GET")
     */
    public function showAction(Result $result)
    {

        return $this->render('result/show.html.twig', array(
                    'result' => $result,
        ));
    }

    /**
     * Add award 1
     *
     * @Route("/{quize}/award1/{id}", name="admin_result_award1_add")
     * @Method("GET")
     */
    public function award1Action(Result $result, $quize)
    {
        $result->setAward1(true);
        $em = $this->getDoctrine()->getManager();
        $em->persist($result);
        $em->flush();
        
        return $this->redirectToRoute('admin_result_index', array('quize'=>$quize));
    }
    
    /**
     * Remove award 1
     *
     * @Route("/{quize}/award1_remove/{id}", name="admin_result_award1_remove")
     * @Method("GET")
     */
    public function award1RemoveAction(Result $result, $quize){
        $result->setAward1(false);
        $em = $this->getDoctrine()->getManager();
        $em->persist($result);
        $em->flush();
        
        return $this->redirectToRoute('admin_result_index', array('quize'=>$quize));
    }

    /**
     * Add award 2
     *
     * @Route("/award2/{id}", name="admin_result_award2_add")
     * @Method("GET")
     */
    public function award2Action(Result $result)
    {
        $result->setAward2(true);
        $em = $this->getDoctrine()->getManager();
        $em->persist($result);
        $em->flush();
        
        return $this->forward('AdminBundle:Result:index');
    }
    
    /**
     * Remove award 1
     *
     * @Route("/award2_remove/{id}", name="admin_result_award2_remove")
     * @Method("GET")
     */
    public function award2RemoveAction(Result $result){
        $result->setAward2(false);
        $em = $this->getDoctrine()->getManager();
        $em->persist($result);
        $em->flush();
        
        return $this->forward('AdminBundle:Result:index');
    }

}
