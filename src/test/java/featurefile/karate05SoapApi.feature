Feature: Karate Test Suite 5
  validating  assign soap api content

  @soap
  Scenario:  soap api TestCase1
    Given url "http://tempuri.org/calculator.asmx"
    And header Content-Type = "text/xml; charset=utf-8"
    And request
    """
      <?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <Add xmlns="http://tempuri.org/">
      <intA>100</intA>
      <intB>200</intB>
    </Add>
  </soap:Body>
</soap:Envelope>
    """
    When soap action "http://tempuri.org/Add"
    Then status 200
    * print responseHeaders
    * print responseType
    * print "Testing"
    * print response
    * assert responseTime <= 2000




