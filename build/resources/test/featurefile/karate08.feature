Feature: Karate Test Suite 8
  validating data types of variable

  Scenario: Data type validation TestCase1
    * def a = 52
    * def b = "Karate"
    * def c = true
    * match a == "#number"
    * match b == "#string"
    * match c == "#boolean"
    * print "After data type validation"



