Feature: Karate Test Suite 12
   End to end api testing(api chaining)

  @rest
  Scenario:  Rest api TestCase1
    Given url "http://dummy.restapiexample.com/api/v1/create"
    And request {"name":"Hari","salary":"123","age":"23"}
    When method post
    Then status 200
    * print response
    * def id = response.data.id
    * print id


    Given url "http://dummy.restapiexample.com/api/v1/employee/" + id
    When method get
    Then status 200
    * print response
    * assert response.data.id == id


    Given url "http://dummy.restapiexample.com/api/v1/update/" + id
    And request {"name":"Hari","salary":"12365","age":"26"}
    When method put
    Then status 200
    * print response

    Given url "http://dummy.restapiexample.com/api/v1/delete/" + id
    When method delete
    Then status 200
    * print response
    ## assert with response attributes

    Given url "http://dummy.restapiexample.com"
    And path "/api/v1/delete/" + id
    When method delete
    Then status 200
    * print response









