Feature: GET API feature

  Scenario: get user details
    * print tokenID
    Given header Authorization = 'Bearer '+ tokenID
    Given url 'https://dummyjson.com'
    And path 'products/1'
    When method GET
    Then status 200