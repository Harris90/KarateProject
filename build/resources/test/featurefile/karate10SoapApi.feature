Feature: Karate Test Suite 10
  Reading payload data frome external file

  @soap
  Scenario:  soap api TestCase1
    Given url "https://www.w3schools.com/xml/tempconvert.asmx"
    And header Content-Type = "text/xml; charset=utf-8"
    And request read ("classpath:soapinputdata.xml")
    When soap action "https://www.w3schools.com/xml/CelsiusToFahrenheit"
    Then status 200
    * print responseHeaders
    * print responseHeaders["Server"]
    * print responseHeaders["Server"][0]
    * match responseHeaders["Server"] == ["Microsoft-IIS/7.5"]
    * print responseType
    * match responseType == "xml"
    * print response
    * match response contains "98.8"

    * print responseTime
    * assert responseTime <= 2000
    * match response //CelsiusToFahrenheitResult == 98.8



