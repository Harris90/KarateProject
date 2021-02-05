Feature: Kafka Test Suite22
  Using Kafka Rest Proxy - Consuming Topic

  Background: Init
    Given url "http://192.168.1.62:8082"

  Scenario: Creating Consumer
    Given path "/consumers/my-consumer-group"
    And request
    """
    {
       "name" : "hari_consumer",
       "format" : "json",
       "auto.offset.reset" : "earliest",
       "auto.commit.enable" : "false"
    }
    """
    And header Content-Type = "application/vnd.kafka.json.v2+json"
    When method post
    Then status 200
    * print response
    * match response.instance_id == "hari_consumer"
    * def consumer_url = response.base_uri

    * print consumer_url


  Scenario: Subscribing to topic
    Given path "/consumers/my-consumer-group/instances/hari_consumer/subscription"
    And request
      """
      {
        "topics" : [ "harris_topic3" ]
      }
      """
    And header Content-Type = "application/vnd.kafka.v2+json"
    When method post
    Then status 204



  Scenario: Getting Subscription
    Given path "/consumers/my-consumer-group/instances/hari_consumer/subscription"
    And header Accept = "application/vnd.kafka.v2+json"
    When method get
    Then status 200
    * print response
    * assert response.topics[0] == "harris_topic3"


  Scenario: Getting Subscription records
    Given path "/consumers/my-consumer-group/instances/hari_consumer/records"
    And param timeout = 3000
    And param max_bytes = 300000
    And header Accept = "application/vnd.kafka.json.v2+json"
    When method get
    Then status 200
    * print response


  Scenario: Getting assigned Assignments
    Given path "/consumers/my-consumer-group/instances/hari_consumer/assignments"
    And header Accept = "application/vnd.kafka.v2+json"
    When method get
    Then status 200
    * print response
    * assert response.partitions[0].topic == "harris_topic3"



  Scenario: Deleting assigned subscription
    Given path "/consumers/my-consumer-group/instances/hari_consumer/subscription"
    And header Accept = "application/vnd.kafka.v2+json"
    When method delete
    Then status 204


  Scenario: Deleting consumer
    Given path "/consumers/my-consumer-group/instances/hari_consumer"
    And header Accept = "application/vnd.kafka.v2+json"
    When method delete
    Then status 204

  Scenario: Deleting consumer - Negative Test Case
    Given path "/consumers/my-consumer-group/instances/hari_consumer"
    And header Accept = "application/vnd.kafka.v2+json"
    When method delete
    Then status 404
    * assert response.message == "Consumer instance not found."
