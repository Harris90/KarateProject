Feature: CalledFeature Test Suite 6
  calledFeature from external feature

  @rest
  Scenario: CalledFeature TestCase1
    Given url "https://www.w3schools.com/xml/tempconvert.asmx/CelsiusToFahrenheit"
    And header Content-Type = "application/x-www-form-urlencoded"
    And request "Celsius=56"
    When method POST
    Then status 200
    * print responseHeaders
    * print responseType
    * print responseTime
    * print response
    * match responseType == "xml"
    * assert responseTime <= 1100
    * match response contains "2.8"
    * match response //string == 132.8






