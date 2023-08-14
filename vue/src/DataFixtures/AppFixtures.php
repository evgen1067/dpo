<?php

namespace App\DataFixtures;

use App\Entity\EducationOption;
use App\Entity\Resume;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use JetBrains\PhpStorm\ArrayShape;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $averageArray = $this->newStatus();
        foreach ($averageArray as $resume) {
            $manager->persist($resume);
        }

        $interviewArray = $this->interviewStatus();
        foreach ($interviewArray['interview'] as $resume) {
            $manager->persist($resume);
        }

        foreach ($interviewArray['resumeOptions'] as $options) {
            $manager->persist($options);
        }

        $acceptedArray = $this->acceptedStatus();
        foreach ($acceptedArray['interview'] as $resume) {
            $manager->persist($resume);
        }

        foreach ($acceptedArray['resumeOptions'] as $options) {
            $manager->persist($options);
        }

        $refusedArray = $this->refusedStatus();
        foreach ($refusedArray['interview'] as $resume) {
            $manager->persist($resume);
        }

        foreach ($refusedArray['resumeOptions'] as $options) {
            $manager->persist($options);
        }

        $manager->flush();
    }

    /**
     * @return array
     */
    public function newStatus(): array
    {
        $averageArray = [];
        for ($i = 0; $i < 25; $i++) {
            $resume = new Resume();
            $resume
                ->setProfession("test${i}")
                ->setCity("Липецк")
                ->setPhoto("https://cdn4.buysellads.net/uu/1/3386/1525189943-38523.png")
                ->setName("test${i}")
                ->setTelephone("test${i}")
                ->setEmail("test${i}")
                ->setDateOfBirth("test${i}")
                ->setEducation("average")
                ->setSalary("test${i}")
                ->setSkills("test${i}")
                ->setAbout("test${i}")
                ->setStatus("new");
            $averageArray[] = $resume;
        }
        return $averageArray;
    }

    /**
     * @return array[]
     */
    #[ArrayShape(['interview' => "array", 'resumeOptions' => "array"])]
    public function interviewStatus(): array
    {
        $interviewArray = [];
        $resumeOptions = [];
        for ($i = 25; $i < 50; $i++) {
            $resume = new Resume();
            $resume
                ->setProfession("test${i}")
                ->setCity("Липецк")
                ->setPhoto("https://cdn4.buysellads.net/uu/1/3386/1525189943-38523.png")
                ->setName("test${i}")
                ->setTelephone("test${i}")
                ->setEmail("test${i}")
                ->setDateOfBirth("test${i}")
                ->setEducation("average_special")
                ->setSalary("test${i}")
                ->setSkills("test${i}")
                ->setAbout("test${i}")
                ->setStatus("interview");

            $resumeOptionally_1 = new EducationOption();
            $resumeOptionally_2 = new EducationOption();

            $resumeOptionally_1
                ->setInstitution("ЛГТУ")
                ->setFaculty("ФАИ")
                ->setSpecialization("test${i}")
                ->setEndYear("test${i}")
                ->setResume($resume);

            $resumeOptionally_2
                ->setInstitution("ЛГТУ")
                ->setFaculty("ФТФ")
                ->setSpecialization("test${i}")
                ->setEndYear("test${i}")
                ->setResume($resume);

            $resumeOptions[] = $resumeOptionally_1;
            $resumeOptions[] = $resumeOptionally_2;

            $interviewArray[] = $resume;
        }
        return [
            'interview' => $interviewArray,
            'resumeOptions' => $resumeOptions,
        ];
    }

    /**
     * @return array[]
     */
    #[ArrayShape(['interview' => "array", 'resumeOptions' => "array"])]
    public function acceptedStatus(): array
    {
        $interviewArray = [];
        $resumeOptions = [];
        for ($i = 50; $i < 75; $i++) {
            $resume = new Resume();
            $resume
                ->setProfession("test${i}")
                ->setCity("Липецк")
                ->setPhoto("https://cdn4.buysellads.net/uu/1/3386/1525189943-38523.png")
                ->setName("test${i}")
                ->setTelephone("test${i}")
                ->setEmail("test${i}")
                ->setDateOfBirth("test${i}")
                ->setEducation("unfinished_higher")
                ->setSalary("test${i}")
                ->setSkills("test${i}")
                ->setAbout("test${i}")
                ->setStatus("accepted");

            $resumeOptionally_1 = new EducationOption();
            $resumeOptionally_2 = new EducationOption();

            $resumeOptionally_1
                ->setInstitution("ЛГТУ")
                ->setFaculty("ФАИ")
                ->setSpecialization("test${i}")
                ->setEndYear("test${i}")
                ->setResume($resume);

            $resumeOptionally_2
                ->setInstitution("ЛГТУ")
                ->setFaculty("ФТФ")
                ->setSpecialization("test${i}")
                ->setEndYear("test${i}")
                ->setResume($resume);

            $resumeOptions[] = $resumeOptionally_1;
            $resumeOptions[] = $resumeOptionally_2;

            $interviewArray[] = $resume;
        }
        return [
            'interview' => $interviewArray,
            'resumeOptions' => $resumeOptions,
        ];
    }

    /**
     * @return array[]
     */
    #[ArrayShape(['interview' => "array", 'resumeOptions' => "array"])]
    public function refusedStatus(): array
    {
        $interviewArray = [];
        $resumeOptions = [];
        for ($i = 75; $i < 100; $i++) {
            $resume = new Resume();
            $resume
                ->setProfession("test${i}")
                ->setCity("Липецк")
                ->setPhoto("https://cdn4.buysellads.net/uu/1/3386/1525189943-38523.png")
                ->setName("test${i}")
                ->setTelephone("test${i}")
                ->setEmail("test${i}")
                ->setDateOfBirth("test${i}")
                ->setEducation("higher")
                ->setSalary("test${i}")
                ->setSkills("test${i}")
                ->setAbout("test${i}")
                ->setStatus("refused");

            $resumeOptionally_1 = new EducationOption();
            $resumeOptionally_2 = new EducationOption();

            $resumeOptionally_1
                ->setInstitution("ЛГТУ")
                ->setFaculty("ФАИ")
                ->setSpecialization("test${i}")
                ->setEndYear("test${i}")
                ->setResume($resume);

            $resumeOptionally_2
                ->setInstitution("ЛГТУ")
                ->setFaculty("ФТФ")
                ->setSpecialization("test${i}")
                ->setEndYear("test${i}")
                ->setResume($resume);

            $resumeOptions[] = $resumeOptionally_1;
            $resumeOptions[] = $resumeOptionally_2;

            $interviewArray[] = $resume;
        }
        return [
            'interview' => $interviewArray,
            'resumeOptions' => $resumeOptions,
        ];
    }
}
