@StoreUpdate
Feature: Update a pet to the store

  Background: url, archivos y variables
    Given url urlBase
    * def bodyUpdate = read('classpath:bdd/req/bodyUpdatePet.json')
    * def validadorJson = read('classpath:bdd/schema/validatorUpdatePetBodyEmpty.json')
    * def validadorJsonSuccess = read('classpath:bdd/schema/validatorAddPet.json')


  @StoreUpdateTest1
  Scenario: Update a new pet with empty body
    Given path 'v2/pet/'
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    When method put
    Then status 405
    * print response
    * match response == validadorJson


  @StoreUpdateTest2
  Scenario: Update a new pet with empty accept
    Given path 'v2/pet/'
    And header Accept = ''
    And header Content-Type = 'application/json'
    And request bodyUpdate
    When method put
    Then status 200
    * print response
    * match response == validadorJsonSuccess

  @StoreUpdateTest3
  Scenario: Update a new pet without Content-Type
    Given path 'v2/pet/'
    And header Accept = '*/*'
    When method put
    Then status 415
    * print response