Feature: Kafka Test Suite24
  Using scenario and feature level test fixture(karate hooks)

  Background: init
    * print "from background block"

    * configure afterScenario =
    """
    function (){
    karate.log("from after scenario")
    }
    """
    * configure afterFeature =
    """
    function (){
    karate.log("from after feature")
    }
    """


  Scenario: karate hooks Testcase
    * print "from scenario block"




