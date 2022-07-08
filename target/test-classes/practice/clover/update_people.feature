Feature: People Update Data
  As a user,
  I should be able to UPDATE a data using Ghibli API
  The IP you can use is this https://ghibliapi.herokuapp.com

  Background:
    Given url ghibli_url
    # create new data before each update scenario
    # so we can use newly generated date for updating
    ## Bring the type called PeopleUtility
    * def PeopleUtility = Java.type("practice.utility.PeopleUtility")
    # call the method and store the result into variable
    * def randomMapBody = PeopleUtility.getRandomPeopleMapBody()
    Given path "/people"
    And header Content-Type = "application/json; charset=utf-8"
    And request randomMapBody
    When method POST
    * def newId = response.id
    ## Generate randomUpdateBody
    * def randomUpdatedBody = PeopleUtility.getRandomPeopleMapBody()
    * print "randomUpdatedBody"

    # In order to check if it is actually updated send another Get Request
    Given path "/people"
    When method GET
    Then status 200
    # Optionally check each and every field value matches

  Scenario: Should be able to UPDATE data
    Given path "/people"
    And header Content-Type = "application/json; charset=utf-8"
    And request randomUpdatedBody
    When method PUT
    Then status 204

    ## Optionally Clean up this Data by Sending DELETE request
    Given path "/people" + newId
    When method DELETE
    Then status 204
    ## How do you know it is actually deleted
    Given path "/people" + newId
    When method GET
    Then status 404

