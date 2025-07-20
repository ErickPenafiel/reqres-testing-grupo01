Feature: Obtener lista de colores

Scenario: Validar estructura y contenido de la primera página
  Given url 'https://reqres.in/api/unknown'  
  And header x-api-key = 'reqres-free-v1'
  And header Content-Type = 'application/json'

  When method GET
  Then status 200
  And match response.page == 1
  And match response.per_page == 6
  And assert response.total >= 6
  And match response.data[0] contains { id: 1, name: 'cerulean', year: 2000 }
  And match response.data[0].color == '#98B2D1'
  And match response.support.text contains 'Content Caddy'
