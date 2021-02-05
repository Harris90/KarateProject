Feature: Karate Test Suite 3
  validating XML content

  Scenario:  XML test case 1
    Given  def xml = <info><id>101</id><tool><name>Karate</name><version>0.9.6</version></tool></info>
    * print xml
    * print xml/info/id
    * print xml.info.id
    * print xml.info.tool.name

  Scenario:  XML test case 2
    Given  def xml =
    """
    <info>
      <id>101</id>
        <tool>
          <name>Karate</name>
          <version>0.9.6</version>
        </tool>
    </info>
    """
    * print xml/info/id
    * print xml.info.id
    * print xml.info.tool.name

  Scenario:  XML test case 3
    Given  def xml = <info><id>101</id><tool><name>Karate</name><version>0.9.6</version></tool></info>
    * match xml/info/id == 101
    * match xml.info.tool.name == "Karate"

  Scenario:  XML test case 4
    Given  def xml = <info><id>101</id><tool><name>Karate</name><version>0.9.6</version></tool></info>
    * match xml contains "xyz"
    * print "end of match"

  Scenario:  XML test case 5
    Given  def xml = <info><id>101</id><tool><name>Karate</name><version>0.9.6</version></tool></info>
    * match xml contains "Karate"
    * match xml contains "<name>Karate</name>"
    * print "end of match"

  Scenario:  XML test case 6
    Given  def xml =
    """
      <info>
          <tool>
            <name>Karate</name>
            <version>0.9.6</version>
          </tool>
          <tool>
            <name>IntelliJ</name>
            <version>2020.2</version>
          </tool>
      </info>
    """
    * match xml/info/tool[1]/name contains "Karate"
    And match xml/info/tool[2]/name == "IntelliJ"
    * match xml/info/tool[1]/name contains "Karate"
    || match xml/info/tool[2]/name == "Intell3435"
    * match xml/info/tool[2]/name == "IntelliJ"
    * print "end of match"

