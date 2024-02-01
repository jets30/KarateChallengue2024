@Store2
Feature:  pet to the store

  Background: url, archivos y variables
    Given url urlBase
    * def bodyUpdate = read('classpath:bdd/req/bodyUpdatePet.json')
    * callonce read('AddPet.feature@StoreAddPetTest1')
    * def validadorJson = read('classpath:bdd/schema/validatorAddPet.json')
    * def validadorUpdateJson = read('classpath:bdd/schema/validatorUpdatePetStatus.json')


  @Consult
  Scenario: Get a new pet by id
  * print  "resultado: " + idPet
  Given path 'v2/pet/' + idPet
  And header Accept = '*/*'
  When method get
  Then status 200
  * print response
  * match response == validadorJson


  @Update
  Scenario: Update a new pet
    Given path 'v2/pet/'
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    And request bodyUpdate
    When method put
    Then status 200
    * print response
    * match response == validadorJson

  @Update2
  Scenario: Update a new pet by form
  * print idPet
  Given path 'v2/pet/' + idPet
  And header Accept = '*/*'
  And form field name = 'lick'
  And form field status = 'sold'
  When method post
  Then status 200
  * print response
  * match response == validadorUpdateJson

  @Status
  Scenario: Get a new pet by status
  Given path 'v2/pet/findByStatus'
  And param status = 'sold'
  And header accept = 'application/json'
  When method get
  Then status 200
  * print response
  * match response =='#array'
