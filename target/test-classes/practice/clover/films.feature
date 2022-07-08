Feature: Ghibli API try out
  As a user,
  I should be able to ping Ghibli API
  The IP you can use is this https://ghibliapi.herokuapp.com
  
  # You can reuse first step or first few steps of scenarios if it repeat
  # using Background: section
  Background:
    Given url ghibli_url

  Scenario: Should be able to GET Request for /films endpoint
    
    # set up the base url
    # Given url "https://ghibliapi.herokuapp.com/films"
    # path can be used to add more path to the base url defined above
    Given path "/films"
    When method GET
    Then status 200
    Then match header Content-Type == "application/json; charset=utf-8"
    # used match operation for assertions, also 'contains' works as well
    Then match header Content-Type contains 'application'
    # This is how we can assert entire body using response and match keyword
    # Then match response == "string"


