@api @poetry_mock @i18n @poetry
Feature: TMGMT Poetry features
  In order to request Small Jobs translations with Poetry service.
  As an Administrator
  I want to be able to create/manage translation requests.

  Background:
    Given the module is enabled
      |modules                |
      |tmgmt_poetry_mock      |
      |tmgmt_poetry_smalljobs |
    And tmgmt_poetry is configured to use tmgmt_poetry_mock
    And the following languages are available:
      | languages |
      | en        |
      | pt-pt     |
      | fr        |
    And I am logged in as a user with the "administrator" role

  @javascript
  Scenario: I can translate contents with Small Jobs.
    Given I am viewing a multilingual "page" content:
      | language | title   |
      | en       | My page |
    When I click "Translate" in the "primary_tabs" region
    And I press "Add to cart"
    Then I should see the success message "1 content source was added into the cart."
    Then I click "cart" in the "messages" region

  @javascript
  Scenario: I can translate menus with Small Jobs.
    When I go to "admin/structure/menu/manage/user-menu/translate"
    And I press "Add to cart"
    Then I should see the success message "1 content source was added into the cart."
    Then I click "cart" in the "admin_messages" region

  @javascript
  Scenario: I can translate vocabularies with Small Jobs.
    When I go to "admin/structure/taxonomy/classification/translate"
    And I press "Add to cart"
    Then I should see the success message "1 content source was added into the cart."

  @javascript
  Scenario: I can translate terms with Small Jobs.
    When I go to "admin/structure/taxonomy/classification/edit"
    And I select the radio button "Localize. Terms are common for all languages, but their name and description may be localized."
    And I press "Save and translate"
    And I press "Add to cart"
    Then I should see the success message "1 content source was added into the cart."

  @javascript
  Scenario: I can translate blocks with Small Jobs.
    When I go to "admin/structure/block/manage/user/login/configure"
    And I click "Languages" in the "admin_vertical_tabs" region
    And I check the box "Make this block translatable"
    And I press "Save and translate"
    And I press "Add to cart"
    Then I should see the success message "1 content source was added into the cart."

  @javascript
  Scenario: I can translate strings with Small Jobs.
    When I go to "admin/tmgmt/sources/locale_default?label=Edit"
    And I check the box on the "Edit" row
    And I press "Add to cart"
    Then I should see the success message "1 content source was added into the cart."
