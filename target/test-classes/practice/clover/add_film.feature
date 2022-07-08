Feature: Studio Ghibli add Data using Post requests
  As a user,
  I should be able to Add data using Ghibli API
  The IP you can use is this https://ghibliapi.herokuapp.com

  Background:
    Given url ghibli_url

  Scenario: Should be able to add data using POST /films
    Given def titleName = "Clover"
    Then print titleName
    * def payload =
        """
          {
              "id": "1ec5d0da-751a-42db-b9a1-436f3325714e"
          }
        """
    Given path "/films"
    And header Content-Type = "application/json; charset=utf-8"
    And request payload
    When method POST
    Then status 201
    * print "Newly generated film ID", response.id
