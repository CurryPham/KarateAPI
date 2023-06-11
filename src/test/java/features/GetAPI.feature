Feature: GET API features

  Scenario: get user details
    Given url 'https://dummyjson.com'
    And path 'products/1'
    When method GET
    Then status 200
#    * print response
#    * def jsonResponse = response
#    * print jsonResponse
    And def actId = response.id
    And def actDescription = response.description
    And def actTitle = response.title
    And match actId == 1
    And match actTitle == 'iPhone 9'
    And match actDescription == 'An apple mobile which is nothing like apple'


#  Scenario: get user details
#    Given url 'https://dummyjson.com'
#    And path '1'
#    When method GET
#    Then status 404

