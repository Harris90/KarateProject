Feature: Karate Test Suite 15


  Background: dbInit
    * def db = Java.type('misc.Mydbutils')

  @select
  Scenario: select stmt test case

    * def rows = db.selectStatement("select * from tools")
    * print rows
    * match rows contains "Selenium"


  Scenario: insert stmt test case

    * def res = db.insertStatement("Insert into tools values(562,'sample2','xyz')")
    * print res
    * match res == 'Success'

  Scenario: update stmt test case

    * def rowsAffected = db.updateStatement("update tools set toolName='sample3' where toolId=30")
    * print rowsAffected
    * assert rowsAffected >= 1

  Scenario: delete stmt test case

    * def rowsAffected = db.deleteStatement("delete from tools where toolId=30")
    * print rowsAffected
    * assert rowsAffected >= 1




