Feature: Kafka Test Suite21
  Using Kafka Rest Proxy - Producing topic

  Background: Init
    Given url "http://192.168.1.62:8082"

  Scenario: Producing Topic
    Given path "/topics/harris_topic3"
    And request
    """
    {
        "records" : [
          {
              "key" : "key3",
              "value" : "practice"
          },
          {
              "value" : "val3",
              "partition" : 0
          },
          {
              "value" : 123.3
          }
        ]
    }
    """
    And header Content-Type = "application/vnd.kafka.json.v2+json"
    And header Accept = "application/vnd.kafka.v2+json"
    When method post
    Then status 200
    * print response
    * match response.offsets[1].partition == 0

