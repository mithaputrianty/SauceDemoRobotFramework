*** Settings ***
Library    SeleniumLibrary
# Library    YAMLLibrary
Resource   ../variables/saucedemo_variables.robot
Variables  ../variables/login_locators.yaml

*** Keywords ***
Given User access Sauce Demo website
    Go to           ${base_url}
    Sleep    2s

When User input Username ${username}
    Input Text    ${username_field}    ${username}

And User input Password ${password}
    Input Text    ${password_field}    ${password}
    Sleep    2s

And User click Login button
    Click Element    ${login_button}

Then User successfully login to Sauce Demo website
    Wait Until Page Contains    Products
    Sleep    2s

#Invalid credential & locked_out_user
Then User failed to login because see error message ${error_message}
    Run Keyword If		'${error_message}'=='Invalid username' or '${error_message}'=='Invalid password'     Wait Until Page Contains    Epic sadface: Username and password do not match any user in this service
    ...    ELSE IF    '${error_message}'=='Empty username' or '${error_message}'=='Empty username and password'    Wait Until Page Contains    Epic sadface: Username is required
    ...    ELSE IF    '${error_message}'=='Empty password'     Wait Until Page Contains    Epic sadface: Password is required
    ...    ELSE IF    '${error_message}'=='Locked out user'    Wait Until Page Contains    Epic sadface: Sorry, this user has been locked out


User login as ${role}
    Open Browser    about:blank    Firefox
    Maximize Browser Window
    Go to           ${base_url}
    Run Keyword If    '${role}'=='standard_user'    Input Text    ${username_field}    ${role}
    ...    ELSE IF    '${role}'=='problem_user'    Input Text    ${username_field}    ${role}
    ...    ELSE IF    '${role}'=='performance_glitch_user'    Input Text    ${username_field}    ${role}
    ...    ELSE IF    '${role}'=='error_user'    Input Text    ${username_field}    ${role}
    ...    ELSE IF    '${role}'=='visual_user'    Input Text    ${username_field}    ${role}
    Input Text    ${password_field}    secret_sauce
    Click Element    ${login_button}
    Wait Until Page Contains    Products
    Sleep    2s