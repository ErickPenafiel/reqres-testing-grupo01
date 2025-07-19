Feature: Actualizar usuario con PUT

Scenario Outline: Actualizar un usuario con datos manuales
  Given url 'https://reqres.in/api'
  And path 'users', '<userId>'
  And header x-api-key = 'reqres-free-v1'
  And header Content-Type = 'application/json'

  * def bodyRequest =
  """
  {
    "name": "<nombre>",
    "job": "<trabajo>"
  }
  """

  And request bodyRequest
  When method PUT
  Then status 200

  And match response.name == "<nombre>"
  And match response.job == "<trabajo>"
  And match response.updatedAt != null

Examples:
  | userId | nombre  | trabajo        |
  | 2      | Edwin   | Tester        |
  | 3      | Juan    | Desarrollador |
  | 4      | María   | Analista      |
