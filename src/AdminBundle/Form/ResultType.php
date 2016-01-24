<?php

namespace AdminBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class ResultType extends AbstractType
{

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
                ->add('name', TextType::class, array('label' => 'Imię:', 'max_length'=> '255'))
                ->add('surname', TextType::class, array('label' => 'Nazwisko:', 'max_length'=> '255'))
                ->add('email', TextType::class, array('label' => 'Adres e-mail:', 'max_length'=> '255'))
                ->add('npwz', TextType::class, array('label' => 'NPWZ:', 'max_length'=> '255'))
                ->add('specialization', TextType::class, array('label' => 'Specjalizacja:', 'max_length'=> '255'))
                ->add('street', TextType::class, array('label' => 'Ulica:', 'max_length'=> '255'))
                ->add('houseNr', TextType::class, array('label' => 'Nr domu:', 'max_length'=> '255'))
                ->add('flatNr', TextType::class, array('label' => 'Lokal:', 'max_length'=> '255', 'required'=>false))
                ->add('postCode', TextType::class, array('label' => 'Kod pocztowy:', 'max_length'=> '255'))
                ->add('city', TextType::class, array('label' => 'Miasto:', 'max_length'=> '255'))
                ->add('phone', TextType::class, array('label' => 'Telefon:', 'max_length'=> '255'))
                ->add('agree1')
                ->add('agree2')
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
