Feature: Kafka Test Suite23
  Reading global variables from karate config file
  Scenario: karate config Testcase
    Given url baseUrl
    And path listUsers
    When method get
    Then status 200
    * print response





