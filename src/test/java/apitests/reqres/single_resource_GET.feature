Feature: Validar obtención correcta de un recurso existente - TC_SR_001

  Background:
    * url 'https://reqres.in/api'

  Scenario: TC_SR_001 - Verificar que se obtiene un recurso existente correctamente
    Given path 'unknown/2'
    When method GET
    Then status 200
    And assert responseTime < 3000

    # Validar estructura del recurso
    And match response ==
      """
      {
        data: {
          id: 2,
          name: "fuchsia rose",
          year: 2001,
          color: "#C74375",
          pantone_value: "17-2031"
        },
        support: {
          url: "#string",
          text: "#string"
        }
      }
      """

    * print "✅ Recurso obtenido correctamente:", response.data
