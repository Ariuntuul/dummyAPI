Feature: Studio Ghibli API try out
  As a user,
  I should be able to ping Studio Ghibli API
  The IP you can use is this https://ghibliapi.herokuapp.com

  Background:
    Given url ghibli_url

  Scenario: Should be able to get all people
    Given path "/people"
    When method GET
    Then status 200
      # This is how you can specify header, using Accept keyword
    And header Accept = "application/json; charset=utf-8"
      # This is how you can assert header, using match keyword
    Then match header Content-Type == "application/json; charset=utf-8"

    # https://ghibliapi.herokuapp.com/people?name=Haku&id=267649ac-fb1b-11eb-9a03-0242ac130003&gender=Male
  Scenario: Should be able to search using params /people endpoint
    Given path "/people"
    And param name = "Haku"
    And param id = "267649ac-fb1b-11eb-9a03-0242ac130003"
    And param gender = "Male"
    When method GET
    Then status 200
      # Using * in index of json array to get all the films instead of one
      # And you can use match someJsonArray contain someItem to partial search
    * print "related person", response.gender


  Scenario: Should be able to get one person using id, then assert related data
    Given path "/people/abe886e7-30c8-4c19-aaa5-d666e60d14de"
    When method GET
    Then status 200
    * print "name of this person is " , response.name
    * print "gender of this person is " , response.gender
    * print "age of this person is " , response.age
    * print "eye color of this person is ", response.eye_color
    * print "hair color of this person is ", response.hair_color
    And match response.name == "Romska Palo Ul Laputa"
    And match response.gender == "Male"
    And match response.age == "33"
    And match response.eye_color == "Black"
    And match response.hair_color == "Brown"


