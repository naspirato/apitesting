Feature: sample GET /api/tiny/profile/ test for zvuk.com

  Background:
    * url 'https://zvuk.com/api/tiny'

  Scenario: get profile

    Given path 'profile'
    When method get
    Then status 200
    And match response == {'result':{'token':'#notnull','id':'#notnull', 'is_anonymous':true}}

    * def user = response

    Given path 'settings'
    When method get
    Then status 200
    And header token = response

    Given path 'grid'
    And form field name = 'zvuk_grid_special'
    When method get
    Then status 200