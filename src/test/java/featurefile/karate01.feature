Feature: Karate Test Suite 1
  this is my first karate hands-on


  Scenario: Karate Test case 1
    Given def a = 10
    And def b = 20
    When def c = a+b
    Then assert c == 30
    And print "c = ",c
    And karate.log("End of the test case")


  Scenario: Karate Test case 2
    Given def a = 20
    * def b = 20
    When def c = a+b
    Then assert c == 40
    * print "c = ",c
    * karate.log("End of the test case 2")

  Scenario: Karate Test case 3
    * def a = 30
    * def b = 20
    * def c = a+b
    * assert c == 50
    * print "c = ",c
    * karate.log("End of the test case 3")
