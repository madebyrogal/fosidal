<?php

namespace AdminBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * AnswerRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class AnswerRepository extends EntityRepository
{
    public function findAllOrder(){
        return $this->findBy(array(), array('question' => 'ASC'));
    }
}
