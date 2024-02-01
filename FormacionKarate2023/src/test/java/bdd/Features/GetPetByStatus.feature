@StoreStatus
Feature:  Search pet in the store by status

  Background: url, archivos y variables
    Given url urlBase
    * callonce read('AddPet.feature')
    * def validadorJson = read('classpath:bdd/schema/validatorAddPet.json')

  @StoreStatusTest1
  Scenario: Get a new pet by empty status
    Given path 'v2/pet/findByStatus'
    And param status = ''
    And header accept = 'application/json'
    When method get
    Then status 200
    * print response
    * match response =='#array'


  @StoreStatusTest2
  Scenario: Get a new pet empty accept
    Given path 'v2/pet/findByStatus'
    And param status = 'sold'
    And header accept = ''
    When method get
    Then status 200
    * print response
    * match response =='#array'


  @StoreStatusTest3
  Scenario: Get a new pet by  incorrect status
    Given path 'v2/pet/findByStatus'
    And param status = 'rentado'
    And header accept = 'application/json'
    When method get
    Then status 200
    * print response
    * match response =='#array'


