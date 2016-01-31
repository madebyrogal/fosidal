<?php

namespace AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class MainController extends Controller
{
    /**
     * @Route("", name="adminHome")
     */
    public function indexAction()
    {
        return $this->render('AdminBundle:Main:index.html.twig', array('user'
            // ...
        ));
    }
    
    public function userAction(){
        $user =  $this->getUser();
        return $this->render('AdminBundle:Main:user.html.twig', array('user'=>$user));
    }

}
