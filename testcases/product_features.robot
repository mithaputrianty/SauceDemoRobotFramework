*** Settings ***
Library     SeleniumLibrary
Resource    ../steps/login_steps.robot
Resource    ../steps/product_steps.robot
Resource    ../steps/transaction_steps.robot
Suite Setup        Open Browser    about:blank    Firefox
Suite Teardown     Close Browser

*** Keywords ***
Scenario Outline Add product to the cart from Product List page
    [Arguments]    ${role}    ${product_name}
    Given User login as ${role}
    When User click Add to cart button on one of product ${product_name}
    Then Product ${product_name} successfully added to the cart
    And Cart badge will be shown

# Scenario Outline Add product to the cart from Product Detail page
#     [Arguments]    ${role}    ${product_name}
#     Given User login as ${role}
#     When User click one of product ${product_name}
#     Then User navigate to Product Detail page for ${product_name}
#     When User click Add to cart button on Product Detail page
#     Then Product ${product_name} successfully added to the cart
#     And Cart badge will be shown

Scenario Outline Remove product from the cart on Product List page
    [Arguments]    ${role}    ${product_name}
    Given User login as ${role}
    When User click Add to cart button on one of product ${product_name}
    Then Product ${product_name} successfully added to the cart
    When User click Remove button on added product ${product_name} in Product List page
    Then Product ${product_name} successfully removed from cart
    And Remove button on deleted product ${product_name} will be back to Add to cart button
    And Cart badge will be dissapear

Scenario Outline Can't remove selected product from the cart on Product List page when logged in as problem_user and error_user
    [Arguments]    ${role}    ${product_name}
    Given User login as ${role}
    When User click Add to cart button on one of product ${product_name}
    Then Product ${product_name} successfully added to the cart
    When User click Remove button on added product ${product_name} in Product List page
    Then Product ${product_name} can't be removed from cart

Scenario Outline Remove product from the Cart page
    [Arguments]    ${role}    ${product_name}
    Given User login as ${role}
    When User click Add to cart button on one of product ${product_name}
    Then Product ${product_name} successfully added to the cart
    When User click Cart icon
    Then User navigate to Your Cart Page
    When User click remove button on one of product ${product_name} from Cart page
    Then Product ${product_name} successfully removed from the Cart page
    And Cart badge will be reduced

*** Test Cases ***
Add product to the cart from Product List page
    [Template]    Scenario Outline Add product to the cart from Product List page
    standard_user    Sauce Labs Bolt T-Shirt
    problem_user    Sauce Labs Backpack
    performance_glitch_user    Sauce Labs Fleece Jacket
    error_user    Sauce Labs Onesie
    visual_user    Sauce Labs Bike Light

# Add product to the cart from Product Detail page
#     [Template]    Scenario Outline Add product to the cart from Product Detail page
#     standard_user    Sauce Labs Bike Light

Remove product from the cart on Product List page
    [Template]    Scenario Outline Remove product from the cart on Product List page
    standard_user    Sauce Labs Bolt T-Shirt
    performance_glitch_user    Sauce Labs Fleece Jacket
    visual_user    Sauce Labs Bike Light

Can't remove selected product from the cart on Product List page when logged in as problem_user and error_user
    [Template]    Scenario Outline Can't remove selected product from the cart on Product List page when logged in as problem_user and error_user
    problem_user    Sauce Labs Backpack
    problem_user    Sauce Labs Bike Light
    error_user    Sauce Labs Onesie

Remove product from the Cart page
    [Template]    Scenario Outline Remove product from the Cart page
    standard_user    Sauce Labs Bolt T-Shirt
    problem_user    Sauce Labs Backpack
    performance_glitch_user    Sauce Labs Fleece Jacket
    error_user    Sauce Labs Onesie
    visual_user    Sauce Labs Bike Light