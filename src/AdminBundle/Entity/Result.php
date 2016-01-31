<?php

namespace AdminBundle\Entity;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use AdminBundle\Entity\Survey;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * Result
 *
 * @ORM\Table(name="result")
 * @ORM\Entity(repositoryClass="AdminBundle\Repository\ResultRepository")
 * @UniqueEntity(
 *      fields={"email"},
 *      repositoryMethod="checkUniqueEmailInCompetition",
 *      message="Ten email brał już udział w tej edycji konkursu."
 * )
 */
class Result
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
     * @ORM\Column(name="name", type="string", length=255, nullable=true)
     * @Assert\NotBlank(message="To pole nie może być puste")
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="surname", type="string", length=255)
     * @Assert\NotBlank(message="To pole nie może być puste")
     */
    private $surname;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255)
     * @Assert\NotBlank(message="To pole nie może być puste")
     * @Assert\Email(message="Podaj poprawny e-mail")
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="street", type="string", length=255)
     * @Assert\NotBlank(message="To pole nie może być puste")
     */
    private $street;

    /**
     * @var string
     *
     * @ORM\Column(name="houseNr", type="string", length=255)
     * @Assert\NotBlank(message="To pole nie może być puste")
     */
    private $houseNr;

    /**
     * @var string
     *
     * @ORM\Column(name="flatNr", type="string", length=255, nullable=true)
     */
    private $flatNr;

    /**
     * @var string
     *
     * @ORM\Column(name="postCode", type="string", length=255)
     * @Assert\NotBlank(message="To pole nie może być puste")
     * @Assert\Regex(
     *     pattern="/[0-9 ]{5}/",
     *     match=true,
     *     message="Podaj prawidłowy kod"
     * )
     */
    private $postCode;

    /**
     * @var string
     *
     * @ORM\Column(name="city", type="string", length=255)
     * @Assert\NotBlank(message="To pole nie może być puste")
     */
    private $city;

    /**
     * @var string
     *
     * @ORM\Column(name="phone", type="string", length=255)
     * @Assert\NotBlank(message="To pole nie może być puste")
     * @Assert\Regex(
     *     pattern="/[0-9- +]{9,16}/",
     *     match=true,
     *     message="Podaj prawidłowy nr telefon"
     * )
     */
    private $phone;

    /**
     * @var bool
     *
     * @ORM\Column(name="agree1", type="boolean")
     * @Assert\NotBlank(message="Musisz zaznaczyć to pole")
     */
    private $agree1;

    /**
     * @var bool
     *
     * @ORM\Column(name="agree2", type="boolean")
     */
    private $agree2;

    /**
     * @var int
     *
     * @ORM\Column(name="points", type="integer")
     */
    private $points;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text")
     */
    private $content;

    /**
     * @ORM\ManyToOne(targetEntity="Survey")
     * @ORM\JoinColumn(name="survey_id", referencedColumnName="id")
     */
    private $survey;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(name="created", type="datetime")
     */
    private $created;

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
     * @return Result
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
     * Set surname
     *
     * @param string $surname
     * @return Result
     */
    public function setSurname($surname)
    {
        $this->surname = $surname;

        return $this;
    }

    /**
     * Get surname
     *
     * @return string 
     */
    public function getSurname()
    {
        return $this->surname;
    }

    /**
     * Set email
     *
     * @param string $email
     * @return Result
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string 
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set street
     *
     * @param string $street
     * @return Result
     */
    public function setStreet($street)
    {
        $this->street = $street;

        return $this;
    }

    /**
     * Get street
     *
     * @return string 
     */
    public function getStreet()
    {
        return $this->street;
    }

    /**
     * Set houseNr
     *
     * @param string $houseNr
     * @return Result
     */
    public function setHouseNr($houseNr)
    {
        $this->houseNr = $houseNr;

        return $this;
    }

    /**
     * Get houseNr
     *
     * @return string 
     */
    public function getHouseNr()
    {
        return $this->houseNr;
    }

    /**
     * Set flatNr
     *
     * @param string $flatNr
     * @return Result
     */
    public function setFlatNr($flatNr)
    {
        $this->flatNr = $flatNr;

        return $this;
    }

    /**
     * Get flatNr
     *
     * @return string 
     */
    public function getFlatNr()
    {
        return $this->flatNr;
    }

    /**
     * Set postCode
     *
     * @param string $postCode
     * @return Result
     */
    public function setPostCode($postCode)
    {
        $this->postCode = $postCode;

        return $this;
    }

    /**
     * Get postCode
     *
     * @return string 
     */
    public function getPostcode()
    {
        return $this->postCode;
    }

    /**
     * Set city
     *
     * @param string $city
     * @return Result
     */
    public function setCity($city)
    {
        $this->city = $city;

        return $this;
    }

    /**
     * Get city
     *
     * @return string 
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set phone
     *
     * @param string $phone
     * @return Result
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone
     *
     * @return string 
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set agree1
     *
     * @param boolean $agree1
     * @return Result
     */
    public function setAgree1($agree1)
    {
        $this->agree1 = $agree1;

        return $this;
    }

    /**
     * Get agree1
     *
     * @return boolean 
     */
    public function getAgree1()
    {
        return $this->agree1;
    }

    /**
     * Set agree2
     *
     * @param boolean $agree2
     * @return Result
     */
    public function setAgree2($agree2)
    {
        $this->agree2 = $agree2;

        return $this;
    }

    /**
     * Get agree2
     *
     * @return boolean 
     */
    public function getAgree2()
    {
        return $this->agree2;
    }

    /**
     * Get created
     *
     * @return Datetime 
     */
    public function getCreated()
    {
        return $this->created;
    }

    function getPoints()
    {
        return $this->points;
    }

    function getContent()
    {
        return $this->content;
    }

    function setPoints($points)
    {
        $this->points = $points;
    }

    function setContent($content)
    {
        $this->content = $content;
    }

    function getSurvey()
    {
        return $this->survey;
    }

    function setSurvey(Survey $survey)
    {
        $this->survey = $survey;
    }

}
