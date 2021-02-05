Feature: Karate Test Suite 16
  Writing response to external file

  Scenario: select stmt test case
    * def util = Java.type("misc.Utils")
    Given url "https://reqres.in/api/users?page=2"
    When method get
    Then status 200
    * def res = get response
    * def resname = get response $.data[1].last_name
    * util.writeToFile("result.json",res)
    * util.writeToFile("result.txt",resname)

    * print res


    Scenario: Reading result file
      * def data = read("classpath:result.json")
      * print data

  Scenario: Reading result file
    * def data = read("classpath:result.txt")
    * print data

