Feature: Login exitoso de usuario en Reqres

Scenario: Iniciar sesión correctamente con email y password
  Given url 'https://reqres.in/api'
  And path 'login'
  And header Content-Type = 'application/json'
  And header x-api-key = 'reqres-free-v1' 

  * def bodyRequest =
  """
  {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
  }
  """

  And request bodyRequest
  When method POST
  Then status 200

  And match response.token != null
