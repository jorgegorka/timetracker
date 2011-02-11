Feature: Users can crud labors
  In order to crud labors
  As an user
  I want to crud labors

  Scenario Outline: User can create a labor
    Given I am an user
    When  I fill in "Proyecto" with "<title>"
    And   I fill in "Descripción" with "<body>"
    And   I press "Comenzar"
    Then  I should see "<result>"

    Examples:
      | title                      | body                   | result                             |
      | Como se podan los geranios | Que se me mueren todos | Actividad creada correctamente     |
      |                            | Que se me mueren todos | Proyecto no puede estar vacío      |
      | Como se podan los geranios |                        | Actividad creada correctamente     |

#  Scenario: User can stop an active labor
#    Given I am an user
#    When  I follow "Detener"
#    Then  I should see "Actividad actualizada"
#
#  Scenario: User labor shows right time
#    Given I am an user
#    And   I move time to 1-day
#    And   I fill in "Proyecto" with "Pascual"
#    And   I fill in "Descripción" with "Pascualin"
#    And   I press "Comenzar"
#    When  I move time to 45-minutes
#    And   I follow "Detener"
#    Then  I should see "Total 0:45"
#
#  Scenario: User labor restarted shows right time
#    Given I am an user
#    And   I move time to 1-day
#    And   I fill in "Proyecto" with "Pascual"
#    And   I fill in "Descripción" with "Pascualin"
#    And   I press "Comenzar"
#    When  I move time to 45-minutes
#    And   I follow "Detener"
#    And   I follow "Reanudar"
#    And   I move time to 55-minutes
#    And   I follow "Detener"
#    Then  I should see "Total 1:40"
#
#  Scenario: User shows weekly stats
#    Given I am an user
#    When  I follow "Semana"
#    Then  I should see "Resumen semanal"
#
#  Scenario Outline: User can edit a labor
#    Given I am an user
#    And   I follow "Modificar"
#    When  I fill in "Proyecto" with "<title>"
#    And   I fill in "Descripción" with "<body>"
#    And   I fill in "Tiempo" with "<time>"
#    And   I press "Guardar cambios"
#    Then  I should see "<result>"
#
#    Examples:
#      | title                      | body                   | time | result                              |
#      | Como se podan los geranios | Que se me mueren todos | 1:43 | Actividad actualizada correctamente |
#      #|                            | Que se me mueren todos | 1:00 | Proyecto no puede estar vacío       |
#      | Como se podan los geranios |                        | 1:43 | Actividad actualizada correctamente |
#      | Como se podan los geranios | Que se me mueren todos |      | Actividad actualizada correctamente |
