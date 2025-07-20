Feature: Obtener datos de múltiples usuarios existentes

Scenario Outline: Obtener usuario con ID y validar su información
  Given url 'https://reqres.in/api'
  And path 'users', <userId>
  And header x-api-key = 'reqres-free-v1'
  And header Content-Type = 'application/json'

  When method GET
  Then status 200
  And match response.data.id == <userId>
  And match response.data.email == '<email>'
  And match response.data.first_name == '<first_name>'
  And match response.data.last_name == '<last_name>'
  And match response.data.avatar contains '<avatar_url>'
  And match response.support.url contains 'contentcaddy.io'

Examples:
| userId | email                         | first_name | last_name | avatar_url                 |
| 3      | emma.wong@reqres.in           | Emma       | Wong      | /img/faces/3-image.jpg     |
| 4      | eve.holt@reqres.in            | Eve        | Holt      | /img/faces/4-image.jpg     |
| 5      | charles.morris@reqres.in      | Charles    | Morris    | /img/faces/5-image.jpg     |
| 7      | michael.lawson@reqres.in      | Michael    | Lawson    | /img/faces/7-image.jpg     |