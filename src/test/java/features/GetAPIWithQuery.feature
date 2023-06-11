Feature: GET API features

  Scenario: get user details
    * def query = {brand: 'Apple', category: 'smartphones'}
    Given url 'https://dummyjson.com'
    And path 'products/1'
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: get user details and the count
    * def query = {brand: 'Apple', category: 'smartphones'}
    Given url 'https://dummyjson.com'
    And path 'products/1'
    And params query
    When method GET
    Then status 200
    And def userCount = response.images.length
    And match userCount == 5
    * print userCount

