Feature: Eliminar un usuario en Reqres

Scenario Outline: Eliminar un usuario por ID
  Given url 'https://reqres.in/api'
  And path 'users', '<userId>'
  And header x-api-key = 'reqres-free-v1' 

  When method DELETE
  Then status 204  

Examples:
  | userId |
  | 2      |
  | 3      |
  | 4      |
