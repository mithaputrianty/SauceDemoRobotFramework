*** Settings ***
Library     SeleniumLibrary
Resource    ../steps/login_steps.robot

*** Test Cases ***
Login using valid credential
    [Template]    Scenario Outline Login using valid credential
    standard_user    secret_sauce
    problem_user    secret_sauce
    performance_glitch_user    secret_sauce
    error_user    secret_sauce
    visual_user    secret_sauce

Login using invalid credential
    [Template]    Scenario Outline Login using invalid credential
    performance_user    secret_sauce    Epic sadface: Username and password do not match any user in this service
    standard_user    standard_user    Epic sadface: Username and password do not match any user in this service
    ${EMPTY}    secret_sauce    Epic sadface: Username is required
    standard_user    ${EMPTY}    Epic sadface: Password is required
    ${EMPTY}    ${EMPTY}    Epic sadface: Username is required
    
Login using user locked_out_user
    Given User access Sauce Demo website
    When User input Username
    And User input Password 
    And User click Login button
    Then User failed to login because see error message

*** Keywords ***
Scenario Outline Login using valid credential
    [Arguments]    ${username}    ${password}
    Given User access Sauce Demo website
    When User input Username ${username}
    And User input Password ${password}
    And User click Login button
    Then User successfully login to Sauce Demo website

Scenario Outline Login using invalid credential
    [Arguments]    ${username}    ${password}    ${error_message}
    Given User access Sauce Demo website
    When User input Username ${username}
    And User input Password ${password}
    And User click Login button
    Then User failed to login because see error message ${error_message}