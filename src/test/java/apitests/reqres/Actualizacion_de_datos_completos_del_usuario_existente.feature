Feature: Actualizar usuario completo y validar los datos 

Background:
  * configure ssl = true
  * def isValidId = function(id) { return /^\d+$/.test(id); }
  * def isValidName = function(name) { return /^[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+$/.test(name); }

Scenario Outline: Verificar existencia de usuario y actualizar sus datos

  # Validar que el ID sea un entero positivo (evitar que se envíen IDs no válidos)
  * def idStr = String(<id>)
  * if (!isValidId(idStr)) karate.fail('ID inválido: debe ser un entero positivo')

  # Validar nombres que sean strings con letras y espacios (evitar que se envíen nombres no válidos)
  * if (!isValidName('<first_name>')) karate.fail('Nombre inválido: solo se permiten letras y espacios')
  * if (!isValidName('<last_name>')) karate.fail('Apellido inválido: solo se permiten letras y espacios')

  # Verificar que el usuario exista 
  Given url 'https://reqres.in/api'
  And path 'users', idStr
  And header x-api-key = 'reqres-free-v1'
  When method GET
  Then status 200

  # Actualizar los datos del usuario existente con PUT UPDATE
  Given url 'https://reqres.in/api'
  And path 'users', idStr
  And header x-api-key = 'reqres-free-v1'
  And header Content-Type = 'application/json'

  * def bodyRequest =
  """
  {
    "id": <id>,
    "email": "<email>",
    "first_name": "<first_name>",
    "last_name": "<last_name>",
    "avatar": "<avatar>"
  }
  """

  And request bodyRequest
  When method PUT
  Then status 200

  # Validar los campos actualizados
  And match response.id == <id>
  And match response.email == "<email>"
  And match response.first_name == "<first_name>"
  And match response.last_name == "<last_name>"
  And match response.avatar == "<avatar>"
  And match response.updatedAt != null
  And assert responseTime < 3000
  And match response == "#object"
  And assert response.first_name.length() < 15
  And assert response.last_name.length() < 15
  And assert response.email.contains('@')


Examples:
  | id | email                      | first_name | last_name | avatar                                   |
  | 7  | edwin.lawson@reqres.in   | edwin    | Lawson    | https://reqres.in/img/faces/7-image.jpg  |
  | 8  | Mariana.ferguson@reqres.in | Mariana    | Ferguson  | https://reqres.in/img/faces/8-image.jpg  |
  | 9  | Raul.funke@reqres.in     | Raul     | Funke     | https://reqres.in/img/faces/9-image.jpg  |
  | 10 | Alex.fields@reqres.in     | Alex      | Fields    | https://reqres.in/img/faces/10-image.jpg |
