Feature: Karate Test Suite 14
  calling Java static and non static method external feature

  Scenario: Non static method TC

    * def env1 =
      """
      function()
      {
      var temp  = Java.type('misc.Utils')
      var utils = new temp()
      return utils.method2();
      }
      """
    * print  env1()
    * def res = call env1
    * print res

  Scenario: static method TC

    * def env1 =
      """
      function()
      {
      var temp  = Java.type('misc.Utils')
      return temp.method1();
      }
      """
    * print  env1()
    * def res = call env1
    * print res











