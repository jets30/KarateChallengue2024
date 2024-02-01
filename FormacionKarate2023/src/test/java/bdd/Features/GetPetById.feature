@StatusId
Feature:  Search pet in the store by Id

  Background: url, archivos y variables
    Given url urlBase
    * callonce read('AddPet.feature@StoreAddPetTest1')
    * def validadorJson = read('classpath:bdd/schema/validatorAddPet.json')


  @StatusId1
  Scenario: Get a new pet by without id
    Given path 'v2/pet/'
    And header Accept = '*/*'
    When method get
    Then status 405
    * print response

  @StatusId2
  Scenario: Get a new pet by without accept
    Given path 'v2/pet/' + idPet
    When method get
    Then status 200
    * print response
