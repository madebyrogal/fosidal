<?php

namespace AdminBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TextType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('content', 'Symfony\Component\Form\Extension\Core\Type\TextareaType', array('attr'=>array('class'=>'tinyMCE')))
            ->add('page', 'Symfony\Bridge\Doctrine\Form\Type\EntityType', array('class' => 'AdminBundle:Page', 'choice_label' => 'title'))
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AdminBundle\Entity\Text'
        ));
    }
}
