Feature: Studio Ghibli API try out
  As a user,
  I should be able to ping Studio Ghibli API
  The IP you can use is this https://ghibliapi.herokuapp.com

  Background:
    Given url ghibli_url

  Scenario: Should be able to GET Request for /people endpoint
    Given path "/people"
    When method GET
    Then status 200
    Then match header Content-Type == "application/json; charset=utf-8"
    # used match operation for assertions, also 'contains' works as well
    Then match header Content-Type contains 'application'
    # This is how we can assert entire body using response and match keyword
    # Then match response == "string"