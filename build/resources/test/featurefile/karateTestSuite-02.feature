Feature: Karate Test Suite 2
  validating json content
  
  Scenario:  JSON test case 1
    Given  def json = { "id" : "101", "tool": { "name":"Karate", "version":"0.9.6"}}
    * print json
    * print json.id
    * print json.tool.name

  Scenario:  JSON test case 2
    Given  def json =
    """
    {
        "id" : "101",
        "tool": { "name":"Karate", "version":"0.9.6"}
     }
    """
    * print json
    * print json.id
    * print json.tool.name

  Scenario:  JSON test case 3
    Given  def json = { "id" : "101", "tool": { "name":"Karate", "version":"0.9.6"}}
    * assert json.id == "101"
    * assert json.tool.name == "Karate"

  Scenario:  JSON test case 4
    Given  def json = { "id" : "101", "tool": { "name":"Karate", "version":"0.9.6"}}

    * match json.tool == { "name":"Karate", "version":"0.9.6"}

  Scenario:  JSON test case 4
    Given  def json = { "id" : "101", "tool": { "name":"Karate", "version":"0.9.6"}}

    * match json.tool == { "name":"Karateee", "version":"0.9.5"}

  Scenario:  JSON test case 5
    Given  def json = { "id" : "101", "tool": { "name":"Karate", "version":"0.9.6"}}

    * match json.tool == { "name":"Karate", "version":"0.9.6"}


