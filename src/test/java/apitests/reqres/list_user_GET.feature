Feature: Validar la lista de usuarios de ReqRes

  Background:
    * url 'https://reqres.in/api'

  Scenario Outline: Verifica que la lista de usuarios se obtiene correctamente
    Given path 'users'
    And param page = <page>
    When method GET
    Then status 200
    And assert responseTime < 3000

    # Validar estructura general de la respuesta
    And match response ==
      """
      {
        page: "#number",
        per_page: 6,
        total: "#number",
        total_pages: "#number",
        data: "#[6]",
        support: { url: "#string", text: "#string" }
      }
      """

    # Validar que cada usuario tenga los campos esperados
    And match each response.data ==
      """
      {
        id: "#number",
        email: "#regex ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
        first_name: "#string",
        last_name: "#string",
        avatar: "#regex ^https?://.*"
      }
      """

    * print "✅ Página verificada:", response.page
    * print "✅ Usuarios obtenidos:", karate.sizeOf(response.data)

  Examples:
    | page |
    | 1    |
  
  
    

