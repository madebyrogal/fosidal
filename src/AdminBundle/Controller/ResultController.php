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
     * @Route("/", name="admin_result_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $results = $em->getRepository('AdminBundle:Result')->findBy(array(), array('survey'=>'ASC', 'points' => 'DESC', 'created' => 'DESC'));

        return $this->render('result/index.html.twig', array(
                    'results' => $results,
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
     * @Route("/award1/{id}", name="admin_result_award1_add")
     * @Method("GET")
     */
    public function award1Action(Result $result)
    {
        $result->setAward1(true);
        $em = $this->getDoctrine()->getManager();
        $em->persist($result);
        $em->flush();
        
        return $this->forward('AdminBundle:Result:index');
    }
    
    /**
     * Remove award 1
     *
     * @Route("/award1_remove/{id}", name="admin_result_award1_remove")
     * @Method("GET")
     */
    public function award1RemoveAction(Result $result){
        $result->setAward1(false);
        $em = $this->getDoctrine()->getManager();
        $em->persist($result);
        $em->flush();
        
        return $this->forward('AdminBundle:Result:index');
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
