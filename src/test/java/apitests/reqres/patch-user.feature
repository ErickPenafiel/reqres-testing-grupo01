Feature: Actualizar parcialmente un usuario con PATCH

Scenario Outline: Actualizar nombre y trabajo del usuario
  Given url 'https://reqres.in/api'
  And path 'users', <userId>
  And header x-api-key = 'reqres-free-v1'
  And header Content-Type = 'application/json'

  * def body =
  """
  {
    "name": "<name>",
    "job": "<job>"
  }
  """

  And request body
  When method PATCH
  Then status 200
  And match response.name == "<name>"
  And match response.job == "<job>"
  And match response.updatedAt == '#present'

Examples:
  | userId | name     | job             |
  | 2      | Morpheus | Zion Resident   |
  | 3      | Neo      | The One         |
  | 4      | Trinity  | Operator        |
