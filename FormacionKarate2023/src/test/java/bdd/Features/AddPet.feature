@Store
Feature: New pet to the store

  Background: url, archivos y variables
    Given url urlBase
    * def body = read('classpath:bdd/req/bodyAddPet.json')
    * def validadorJson = read('classpath:bdd/schema/validatorAddPet.json')
    * def validadorJsonWithoutBody = read('classpath:bdd/schema/validatorAddPetWithoutBody.json')

  @StoreAddPetTest1
  Scenario: Add a new pet
    Given path 'v2/pet'
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    * set body.id = 19
    * set body.name = 'Aguila'
    * set body.status = 'available'
    * set body.category.id = 2
    * set body.category.name = 'Ave'
    And request body
    When method post
    Then status 200
    * print response
    * match response == validadorJson
    * def idPet = response.id

  @StoreAddPetTest2
  Scenario: Add a new pet without body
    Given path 'v2/pet'
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    When method post
    Then status 405
    * print response
    * match response == validadorJsonWithoutBody


  @StoreAddPetTest3
  Scenario: Add a new pet without Accept
    Given path 'v2/pet'
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * match response == validadorJson


  @StoreAddPetTest4
  Scenario: Add a new pet empty Content-Type
    Given path 'v2/pet'
    And header Accept = '*/*'
    And header Content-Type = ''
    And request body
    When method post
    Then status 415
    * print response


  @StoreAddPetTest5
  Scenario: Add a new pet with fields not obligatory
    Given path 'v2/pet'
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    And request
    """
    {
    "id" : "4",
    "status" : "sold"
    }
    """
    When method post
    Then status 200
    * print response


