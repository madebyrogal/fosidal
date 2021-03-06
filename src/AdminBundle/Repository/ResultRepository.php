<?php

namespace AdminBundle\Repository;

use Doctrine\ORM\EntityRepository;
use AppBundle\Quiz\Quiz;

/**
 * ResultRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class ResultRepository extends EntityRepository
{

    public function checkUniqueCompetition($fields)
    {
        $em = $this->getEntityManager();
        $quiz = $em->getRepository('AdminBundle:Survey')->findActive();

        $query = $this->createQueryBuilder('r')
                ->where('r.name = :name')
                ->andWhere('r.surname = :surname')
                ->andWhere('r.phone = :phone')
                ->andWhere('r.survey = :survey')
                ->setParameters(array('name' => $fields['name'], 'surname'=>$fields['surname'], 'phone'=>$fields['phone'], 'survey' => $quiz))
                ->getQuery();

        return $query->getResult();
    }

}
