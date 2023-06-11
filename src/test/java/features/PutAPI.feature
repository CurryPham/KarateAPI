Feature: Create user using post api

  Background:
    * url 'https://gorest.co.in'
    * def requestPayload =
	"""
	{
        "name": "curry",
        "email": "curry@gmail.com",
    }

	"""
  Scenario: Update a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method PUT
    Then status 200
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'curry'
    And match $.data.email == 'curry@gmail.com'