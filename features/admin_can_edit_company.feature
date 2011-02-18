Feature: Admin can edit company info
  In order to update information about my company
  As an admin
  I want to edit my company data

  Scenario: Admin can see the company info
    Given I am an admin
    And   I go to the homepage
    When  I follow "Mi empresa"
    Then  I should see "Jorge Alvarez"

  Scenario: User can not see the company info
    Given I am an user
    When  I go to the homepage
    Then  I should not see "Mi empresa"

  Scenario: User can not see the company info
    Given I am an user
    When  I go to the homepage
    And   I go to the adminpage
    Then  I should see "No tienes permiso para acceder a esta página"





































#  Scenario: Admin can edit the company info
#    Given I am an admin
#    And   I follow "Mi empresa"
#    And   I follow "Modificar"
#    When  I fill in "Nombre" with "Rumasa que pasa"
#    And   I fill in "Dirección" with "C/Ruizmateos, 34 5B"
#    And   I press "Guardar datos"
#    Then  I should see "Compañia actualizada correctamente"

#  Scenario Outline: User can edit the company info
#    Given I am an user
#    When  I fill in "Proyecto" with "<name>"
#    And   I fill in "Descripción" with "<address>"
#    And   I press "Comenzar"
#    Then  I should see "<result>"
#
#    Examples:
#      | name                       | address                | result                            |
#      | Como se podan los geranios | Que se me mueren todos | Actividad creada correctamente    |
#      |                            | Que se me mueren todos | Nombre no puede estar vacío       |
#      | Como se podan los geranios |                        | Dirección no puede estar vacío    |
