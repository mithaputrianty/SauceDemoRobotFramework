*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/transaction_variables.robot
Resource   ../variables/product_variables.robot


*** Keywords ***
User navigate to Your Cart Page
    Wait Until Page Contains    Your Cart
    Sleep    2s
        
User click Checkout button on Your Cart Page
    Click Element    ${your_cart_button}[checkout]

User navigate to Checkout: Your Information page
    Wait Until Page Contains    Checkout: Your Information

User input First Name ${first_name}
    Input Text    ${checkout_field}[first_name]    ${first_name}
    Sleep    1s

User input Last Name ${last_name}
    Input Text    ${checkout_field}[last_name]    ${last_name}
    Sleep    1s

User input Zip/Postal Code ${postal_code}
    Input Text    ${checkout_field}[postal_code]    ${postal_code}
    Sleep    1s

User click Continue button on Checkout: Your Information page
    Click Element    ${checkout_button}[continue]

User navigate to Checkout: Overview page
    Wait Until Page Contains    Checkout: Overview
    Sleep    2s

User click Finish button on Checkout: Overview page
    Click Element    ${overview_page}[finish]

Products successfully purchased
    Wait Until Page Contains    Checkout: Complete
    Sleep    1s

Message "Thank you for your order" should be shown 
    Wait Until Page Contains    Thank you for your order
    Close Browser

#Didn't fill data in Your Information page
User failed navigate to Checkout: Overview page because see error_message ${error_message}
    Run Keyword If		'${error_message}'=='Error: First Name is required'     Wait Until Page Contains    ${error_message}
    Run Keyword If		'${error_message}'=='Error: Last Name is required'     Wait Until Page Contains    ${error_message}
    Run Keyword If		'${error_message}'=='Error: Postal Code is required'     Wait Until Page Contains    ${error_message}
    Sleep    2s
    Close Browser