*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/sauce_demo_variables.robot


*** Keywords ***
Given User access Sauce Demo website
    Open browser    about:blank    ${browser}[Edge]
    Go to           ${base_url}
    Maximize Browser Window
    Sleep    2s

When User input Username ${username}
    Input Text    ${login_field}[username]    ${username}

And User input Password ${password}
    Input Text    ${login_field}[password]    ${password}

And User click Login button
    Click Element    ${login_button}[login_button]

Then User successfully login to Sauce Demo website
    Wait Until Page Contains    Products
    Close Browser

#User locked_out_user
When User input Username
    Input Text    ${login_field}[username]    locked_out_user

And User input Password
    Input Text    ${login_field}[password]    secret_sauce

Then User failed to login because see error message
    Wait Until Page Contains    Epic sadface: Sorry, this user has been locked out.
    Close Browser

#Invalid credential
Then User failed to login because see error message ${error_message}
    Run Keyword If		'${error_message}'=='Epic sadface: Username and password do not match any user in this service'     Wait Until Page Contains    Epic sadface: Username and password do not match any user in this service
    Run Keyword If		'${error_message}'=='Epic sadface: Username is required'     Wait Until Page Contains    Username is required
    Run Keyword If		'${error_message}'=='Epic sadface: Password is required'     Wait Until Page Contains    Password is required
    Close Browser

Given User login as ${role}
    Open browser    about:blank    ${browser}[Edge]
    Go to           ${base_url}
    Maximize Browser Window
    Run Keyword If    '${role}'=='standard_user'    Input Text    ${login_field}[username]    ${username}[standard_user]
    Run Keyword If    '${role}'=='standard_user'    Input Text    ${login_field}[password]    ${password}[0]
    Run Keyword If    '${role}'=='problem_user'    Input Text    ${login_field}[username]    ${username}[problem_user]
    Run Keyword If    '${role}'=='problem_user'    Input Text    ${login_field}[password]    ${password}[0]
    Run Keyword If    '${role}'=='performance_glitch_user'    Input Text    ${login_field}[username]    ${username}[performance_glitch_user]
    Run Keyword If    '${role}'=='performance_glitch_user'    Input Text    ${login_field}[password]    ${password}[0]
    Run Keyword If    '${role}'=='error_user'    Input Text    ${login_field}[username]    ${username}[error_user]
    Run Keyword If    '${role}'=='error_user'    Input Text    ${login_field}[password]    ${password}[0]
    Run Keyword If    '${role}'=='visual_user'    Input Text    ${login_field}[username]    ${username}[visual_user]
    Run Keyword If    '${role}'=='visual_user'    Input Text    ${login_field}[password]    ${password}[0]
    Click Element    ${login_button}[login_button]
    Wait Until Page Contains    Products
    Sleep    2s