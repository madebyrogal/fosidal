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

    public function checkUniqueEmailInCompetition($fields)
    {
        $em = $this->getEntityManager();
        $quiz = $em->getRepository('AdminBundle:Survey')->findActive();

        $query = $this->createQueryBuilder('r')
                ->where('r.email = :email')
                ->andWhere('r.survey = :survey')
                ->setParameters(array('email' => $fields['email'], 'survey' => $quiz))
                ->getQuery();

        return $query->getResult();
    }

}
