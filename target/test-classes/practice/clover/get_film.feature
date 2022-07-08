Feature: Ghibli Get Data using get requests
  As a user,
  I should be able to ping Ghibli API
  The IP you can use is this https://ghibliapi.herokuapp.com

  Background:
    Given url ghibli_url

    Scenario: Should be able to get all films using /films endpoint
      Given path "/films"
      When method GET
      Then status 200
      # This is how you can specify header, using Accept keyword
      And header Accept = "application/json; charset=utf-8"
      Then match header Content-Type == "application/json; charset=utf-8"

    # https://ghibliapi.herokuapp.com/films/?title=Grave of the Fireflies
    Scenario: Should be able to search using params /films endpoint
      Given path "/films"
      And param title = "Grave of the Fireflies"
      And param id = "12cfb892-aac0-4c5b-94af-521852e46d6a"
      When method GET
      Then status 200
      # Using * in index of json array to get all the films instead of one
      # And you can use match someJsonArray contain someItem to partial search
      * print "all films", response.title


    Scenario: Should be able to get one film using id
      Given path "/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"
      When method GET
      Then status 200
      ## Karate does not require the Given When Then Keyword
      ## It is just for readability you can replace them with * when needed
      ## Here is how we can print anything
      * print "title of this film is " , response.title
      * print "original_title of this film is " , response.original_title
      * print "director of this film is " , response.director
      * print "release year of this film is ", response.release_date
      And match response.title == "Castle in the Sky"
      And match response.original_title == "天空の城ラピュタ"
      And match response.director == "Hayao Miyazaki"
      And match response.release_date == "1986"










