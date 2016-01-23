<?php

namespace AppBundle\Twig;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AppExtension
 *
 * @author rogal
 */
class AppExtension extends \Twig_Extension
{

    public function getFilters()
    {
        return array(
            new \Twig_SimpleFilter('timer', array($this, 'timerFilter')),
            new \Twig_SimpleFilter('qNumber', array($this, 'qNumberFilter')),
        );
    }

    public function timerFilter($time)
    {
        $min = sprintf("%02d", floor($time) / 60);
        $sec = sprintf("%02d", $time % 60);
        $result = ''.$min .':' . $sec;
        return $result;
    }
    
    public function qNumberFilter($qNumber)
    {
        return sprintf("%02d", $qNumber);
    }

    public function getName()
    {
        return 'app_extension';
    }

}
