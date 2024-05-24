*** Settings ***
Library     SeleniumLibrary
Resource    ../steps/login_steps.robot
Suite Setup        Open Browser    about:blank    Firefox
Suite Teardown     Close Browser

*** Variables ***
# Data for locked_out_user
${username}    locked_out_user
${password}    secret_sauce
${error_message}    Locked out user

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
    performance_user    secret_sauce    Invalid username    
    standard_user    standard_user    Invalid password
    ${EMPTY}    secret_sauce    Empty username
    standard_user    ${EMPTY}    Empty password    
    ${EMPTY}    ${EMPTY}    Empty username and password
    
Login using user locked_out_user
    Given User access Sauce Demo website
    When User input Username ${username}
    And And User input Password ${password}
    And User click Login button
    Then Then User failed to login because see error message ${error_message}