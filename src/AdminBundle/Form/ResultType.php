<?php

namespace AdminBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ResultType extends AbstractType
{

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
                ->add('name', 'Symfony\Component\Form\Extension\Core\Type\TextType', array('label' => 'Imię:', 'max_length'=> '255'))
                ->add('surname', 'Symfony\Component\Form\Extension\Core\Type\TextType', array('label' => 'Nazwisko:', 'max_length'=> '255'))
                ->add('email', 'Symfony\Component\Form\Extension\Core\Type\EmailType', array('label' => 'Adres e-mail:', 'max_length'=> '255'))
                ->add('street', 'Symfony\Component\Form\Extension\Core\Type\TextType', array('label' => 'Ulica:', 'max_length'=> '255'))
                ->add('houseNr', 'Symfony\Component\Form\Extension\Core\Type\TextType', array('label' => 'Nr domu:', 'max_length'=> '255'))
                ->add('flatNr', 'Symfony\Component\Form\Extension\Core\Type\TextType', array('label' => 'Lokal:', 'max_length'=> '255', 'required'=>false))
                ->add('postCode', 'Symfony\Component\Form\Extension\Core\Type\TextType', array('label' => 'Kod pocztowy:', 'max_length'=> '1'))
                ->add('city', 'Symfony\Component\Form\Extension\Core\Type\TextType', array('label' => 'Miasto:', 'max_length'=> '255', 'required'=>true))
                ->add('phone', 'Symfony\Component\Form\Extension\Core\Type\TextType', array('label' => 'Telefon:', 'max_length'=> '255'))
                ->add('agree1', 'Symfony\Component\Form\Extension\Core\Type\CheckboxType', array('required'=>true))
                ->add('agree2', 'Symfony\Component\Form\Extension\Core\Type\CheckboxType', array('required'=>true))
                ->add('points', 'Symfony\Component\Form\Extension\Core\Type\HiddenType')
                ->add('content', 'Symfony\Component\Form\Extension\Core\Type\HiddenType')
        ;
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AdminBundle\Entity\Result',
            'csrf_protection' => true,
            'csrf_field_name' => '_token',
            // a unique key to help generate the secret token
            'csrf_token_id' => 'task_item',
        ));
    }

}
