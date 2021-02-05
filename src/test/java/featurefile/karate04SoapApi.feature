Feature: Karate Test Suite 4
  validating soap api content

  @soap
  Scenario:  soap api TestCase1
    Given url "https://www.w3schools.com/xml/tempconvert.asmx"
    And header Content-Type = "text/xml; charset=utf-8"
    And request
    """
    <?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <CelsiusToFahrenheit xmlns="https://www.w3schools.com/xml/">
      <Celsius>36</Celsius>
    </CelsiusToFahrenheit>
  </soap:Body>
</soap:Envelope>
    """
    When soap action "https://www.w3schools.com/xml/CelsiusToFahrenheit"
    Then status 200
    * print responseHeaders
    * print responseHeaders["Server"]
    * print responseHeaders["Server"][0]
    * match responseHeaders["Server"] == ["Microsoft-IIS/7.5"]
    * print responseType
    * match responseType == "xml"
    * print response
    * match response contains "96.8"

    * print responseTime
    * assert responseTime <= 2000
    * match response //CelsiusToFahrenheitResult == 98.8



