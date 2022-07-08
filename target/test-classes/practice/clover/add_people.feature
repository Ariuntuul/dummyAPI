Feature: Studio Ghibli add Data using Post requests
  As a user,
  I should be able to ADD data using Ghibli API
  The IP you can use is this https://ghibliapi.herokuapp.com

  Background:
    Given url ghibli_url

  Scenario: Should be able to add id using POST /people
    * def payload =
        """
          {
              "id": "c11f394e-c212-4dc7-87fb-664a29921021"
          }
        """
    Given path "/people"
    And header Content-Type = "application/json; charset=utf-8"
    And request payload
    When method POST
    Then status 201
    * print "Newly generated person's ID is", response.id

  Scenario: Should be able to add data using POST /people with Random Body
  ## Bring the type called PeopleUtility and use static method
    * def PeopleUtility = Java.type("practice.utility.PeopleUtility")
  ## Call the method and store the result into variable
    * def randomMapBody = PeopleUtility.getRandomPeopleMapBody()
    * print randomMapBody

    Given path "/people"
    And header Content-Type = "application/json; charset=utf-8"
    When method POST
    Then status 201
    * print "Newly generated person's ID is", response.id






