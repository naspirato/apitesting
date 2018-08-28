Feature: sample GET /api/tiny/profile/ test for zvuk.com

  Background:
    * url 'https://zvuk.com'

  Scenario: get profile

    Given path '/api/tiny/profile/'
    When method get
    Then status 200

    * def user = response

    Given path 'api/tiny/settings/', user.auth
    When method get
    Then status 200