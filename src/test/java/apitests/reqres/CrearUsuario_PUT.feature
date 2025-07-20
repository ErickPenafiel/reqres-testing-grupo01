Feature: Crear usuario con POST en Reqres usando API Key

Scenario Outline: Crear un nuevo usuario con datos válidos
  Given url 'https://reqres.in/api'
  And path 'users'
  And header Content-Type = 'application/json'
  And header x-api-key = 'reqres-free-v1'

  * def bodyRequest =
  """
  {
    "name": "<nombre>",
    "job": "<trabajo>"
  }
  """

  And request bodyRequest
  When method POST
  Then status 201

  And match response.name == "<nombre>"
  And match response.job == "<trabajo>"
  And match response.id != null
  And match response.createdAt != null

Examples:
  | nombre  | trabajo         |
  | Raul   | Tester          |
  | Carla   | QA Analyst      |
  | Marco   | DevOps Engineer |


