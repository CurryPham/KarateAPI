Feature: Create user using post api

  Background:
    * url 'https://gorest.co.in'
    * def random_string =
	"""
		function(s){
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for(var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
		}
	"""
    * def randomString = random_string(10)
    * print randomString

    * def requestPayload = read('classpath:src/test/resources/payload/user.json')

    * set requestPayload.email = randomString + "@gmail.com"

    * print requestPayload


  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'tom'
    And match $.data.email == requestPayload.email


    # fetch the user id from the post call response
    * def userId = $.data.id
    * print userId

    #2nd: put call -- to update the user
    * def requestPayload =
	"""
	{
        "name": "curry",
        "email": "curry@gmail.com",
    }

	"""
  Scenario: Update a user with the given data
    Given path '/public/v1/users/102'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method PUT
    Then status 200
    And match $.data.id == '#present'
    And match $.data.id == userId
    And match $.data.name == '#present'
    And match $.data.name == 'curry'
    And match $.data.email == requestPayload.email