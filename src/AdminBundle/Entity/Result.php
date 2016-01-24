<?php

namespace AdminBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Result
 *
 * @ORM\Table(name="result")
 * @ORM\Entity(repositoryClass="AdminBundle\Repository\ResultRepository")
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
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="surname", type="string", length=255)
     */
    private $surname;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255, unique=true)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="npwz", type="string", length=255, unique=true)
     */
    private $npwz;

    /**
     * @var string
     *
     * @ORM\Column(name="specialization", type="string", length=255)
     */
    private $specialization;

    /**
     * @var string
     *
     * @ORM\Column(name="street", type="string", length=255)
     */
    private $street;

    /**
     * @var string
     *
     * @ORM\Column(name="houseNr", type="string", length=255)
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
     */
    private $postCode;

    /**
     * @var string
     *
     * @ORM\Column(name="city", type="string", length=255)
     */
    private $city;

    /**
     * @var string
     *
     * @ORM\Column(name="phone", type="string", length=255)
     */
    private $phone;

    /**
     * @var bool
     *
     * @ORM\Column(name="agree1", type="boolean")
     */
    private $agree1;

    /**
     * @var bool
     *
     * @ORM\Column(name="agree2", type="boolean")
     */
    private $agree2;


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
     * Set npwz
     *
     * @param string $npwz
     * @return Result
     */
    public function setNpwz($npwz)
    {
        $this->npwz = $npwz;

        return $this;
    }

    /**
     * Get npwz
     *
     * @return string 
     */
    public function getNpwz()
    {
        return $this->npwz;
    }

    /**
     * Set specialization
     *
     * @param string $specialization
     * @return Result
     */
    public function setSpecialization($specialization)
    {
        $this->specialization = $specialization;

        return $this;
    }

    /**
     * Get specialization
     *
     * @return string 
     */
    public function getSpecialization()
    {
        return $this->specialization;
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
     * Set postcode
     *
     * @param string $postcode
     * @return Result
     */
    public function setPostcode($postcode)
    {
        $this->postcode = $postcode;

        return $this;
    }

    /**
     * Get postcode
     *
     * @return string 
     */
    public function getPostcode()
    {
        return $this->postcode;
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
}
