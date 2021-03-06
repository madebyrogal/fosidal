<?php

namespace AdminBundle\Repository;

use Doctrine\ORM\EntityRepository;
use AdminBundle\Entity\Survey;

/**
 * SurveyRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class SurveyRepository extends EntityRepository
{

    public function findActive()
    {
        $now = new \DateTime('now');
        $query = $this->createQueryBuilder('s')
                ->where('s.start <= :start')
                ->andWhere('s.end > :end')
                ->setParameters(array('start' => $now, 'end' => $now))
                ->setMaxResults(1)
                ->getQuery();
        return $query->getOneOrNullResult();
    }
    
    //Get done and active
    public function findActually(){
        $now = new \DateTime('now');
        $query = $this->createQueryBuilder('s')
                ->where('s.start <= :start')
                ->setParameters(array('start' => $now))
                ->setMaxResults(1)
                ->getQuery();
        return $query->getResult();
    }

}
