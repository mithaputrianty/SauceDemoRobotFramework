*** Settings ***
Library     SeleniumLibrary
Library    String
Resource    ../steps/login_steps.robot
Resource    ../steps/product_steps.robot
Resource    ../steps/transaction_steps.robot
Suite Setup    Open Browser    about:blank    Firefox
Suite Teardown     Close Browser

*** Keywords ***
Scenario Outline Purchase product as standard_user
    [Arguments]    ${qty}    ${first_name}    ${last_name}    ${postal_code}
    Given User login as standard_user
    And User add some items to cart until total is ${qty}
    When User click Cart icon
    Then User navigate to Your Cart Page
    When User click Checkout button on Your Cart Page
    Then User navigate to Checkout: Your Information page
    When User input First Name ${first_name}
    And User input Last Name ${last_name}
    And User input Zip/Postal Code ${postal_code}
    And User click Continue button on Checkout: Your Information page
    Then User navigate to Checkout: Overview page
    When User click Finish button on Checkout: Overview page
    Then Products successfully purchased
    And Message "Thank you for your order" should be shown 

Scenario Outline Purchase product as standard_user when user didn't fill data in Your Information page
    [Arguments]    ${qty}    ${first_name}    ${last_name}    ${postal_code}    ${error_message}
    Given User login as standard_user
    And User add some items to cart until total is ${qty}
    When User click Cart icon
    Then User navigate to Your Cart Page
    When User click Checkout button on Your Cart Page
    Then User navigate to Checkout: Your Information page
    When User input First Name ${first_name}
    And User input Last Name ${last_name}
    And User input Zip/Postal Code ${postal_code}
    And User click Continue button on Checkout: Your Information page
    Then User failed navigate to Checkout: Overview page because see error_message ${error_message}
    
*** Test Cases ***
Purchase product as standard_user
    [Template]    Scenario Outline Purchase product as standard_user
    1    Mitha    Putri    41111
    2    Mitha    Putri    41111
    3    Mitha    Putri    41111
        
Purchase product as standard_user when user didn't fill data in Your Information page
    [Template]    Scenario Outline Purchase product as standard_user when user didn't fill data in Your Information page
    1    ${EMPTY}    Putri    41111    Error: First Name is required
    2    Mitha    ${EMPTY}    41111    Error: Last Name is required
    # 3    Mitha    Putri    ${EMPTY}    Error: Postal Code is required
    # 1    ${EMPTY}    ${EMPTY}    41111    Error: First Name is required
    # 2    Mitha    ${EMPTY}    ${EMPTY}    Error: Last Name is required
    # 3    ${EMPTY}    Putri    ${EMPTY}    Error: First Name is required