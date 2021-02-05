Feature: Karate Test Suite 9
  validating regular expression

  Scenario: Regular expression validation TestCase1
    * def a = "52"
    * def b = "Karate"
    * def c = "Kar ate Fram ework "
    * def d = "344Kar ate Fram ework635 "


    * match a == "#regex [0-9]+"
    * match a == "#regex \\d+"
    * match b == "#regex \\w+"
    * match b == "#regex [A-Z][a-z]+"
    * match c == "#regex [A-Za-z\\s]+"
    * match d == "#regex (\\w+\\s?)+"
    * print "After data type validation"



