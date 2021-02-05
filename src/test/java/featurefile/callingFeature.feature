Feature: CallingFeature Test Suite 6
  callingFeature from external feature

  @rest
  Scenario: Calling Feature Test Case 1
    * def result = call read("calledFeature.feature")
    * print result
    * print result.response.string._ == "132.8"







