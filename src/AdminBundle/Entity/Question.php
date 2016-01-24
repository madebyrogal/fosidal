<?php

namespace AdminBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Question
 *
 * @ORM\Table(name="question")
 * @ORM\Entity(repositoryClass="AdminBundle\Repository\QuestionRepository")
 */
class Question
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var int
     *
     * @ORM\Column(name="timeToAnswer", type="integer", nullable=true)
     */
    private $timeToAnswer;

    /**
     * @var int
     *
     * @ORM\Column(name="points", type="integer", nullable=true)
     */
    private $points;

    /**
     * @var int
     *
     * @ORM\Column(name="position", type="integer")
     */
    private $position;
    
    /**
     * @ORM\ManyToOne(targetEntity="Survey", inversedBy="questions")
     * @ORM\JoinColumn(name="survey_id", referencedColumnName="id", onDelete="CASCADE")
     */
    private $survey;
    
    /**
     * @ORM\OneToMany(targetEntity="Answer", mappedBy="question")
     * @ORM\OrderBy({"position" = "ASC"})
     */
    private $answers;
    
    public function __construct()
    {
        $this->answers = new ArrayCollection();
    }

    public function getCorrectAnswer()
    {
        foreach($this->getAnswers() as $answer){
            if($answer->getIsCorrect()) {
                return $answer;
            }
        }
        
        return false;
    }
    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     * @return Question
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set timeToAnswer
     *
     * @param integer $timeToAnswer
     * @return Question
     */
    public function setTimeToAnswer($timeToAnswer)
    {
        $this->timeToAnswer = $timeToAnswer;

        return $this;
    }

    /**
     * Get timeToAnswer
     *
     * @return integer 
     */
    public function getTimeToAnswer()
    {
        return $this->timeToAnswer;
    }

    /**
     * Set points
     *
     * @param integer $points
     * @return Question
     */
    public function setPoints($points)
    {
        $this->points = $points;

        return $this;
    }

    /**
     * Get points
     *
     * @return integer 
     */
    public function getPoints()
    {
        return $this->points;
    }

    /**
     * Set position
     *
     * @param integer $position
     * @return Question
     */
    public function setPosition($position)
    {
        $this->position = $position;

        return $this;
    }

    /**
     * Get position
     *
     * @return integer 
     */
    public function getPosition()
    {
        return $this->position;
    }

    /**
     * Set survey
     *
     * @param \AdminBundle\Entity\Survey $survey
     * @return Question
     */
    public function setSurvey(\AdminBundle\Entity\Survey $survey = null)
    {
        $this->survey = $survey;

        return $this;
    }

    /**
     * Get survey
     *
     * @return \AdminBundle\Entity\Survey 
     */
    public function getSurvey()
    {
        return $this->survey;
    }

    /**
     * Add answers
     *
     * @param \AdminBundle\Entity\Answer $answers
     * @return Question
     */
    public function addAnswer(\AdminBundle\Entity\Answer $answers)
    {
        $this->answers[] = $answers;

        return $this;
    }

    /**
     * Remove answers
     *
     * @param \AdminBundle\Entity\Answer $answers
     */
    public function removeAnswer(\AdminBundle\Entity\Answer $answers)
    {
        $this->answers->removeElement($answers);
    }

    /**
     * Get answers
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getAnswers()
    {
        return $this->answers;
    }
}
