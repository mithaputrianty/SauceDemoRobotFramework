*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/sauce_demo_variables.robot


*** Keywords ***
And User add some items to cart until total is ${qty}
    Run Keyword If		'${qty}'=='1'     Click Element    ${add_product_button}[backpack]
    Run Keyword If		'${qty}'=='2'     Click Element    ${add_product_button}[bikelight]
    Run Keyword If		'${qty}'=='2'     Click Element    ${add_product_button}[boltshirt]
    Run Keyword If		'${qty}'=='3'     Click Element    ${add_product_button}[backpack]
    Run Keyword If		'${qty}'=='3'     Click Element    ${add_product_button}[bikelight]
    Run Keyword If		'${qty}'=='3'     Click Element    ${add_product_button}[boltshirt]
    Sleep    2s    

When User click Cart icon
    Click Element    ${icon}[cart]

Then User navigate to Your Cart Page
    Wait Until Page Contains    Your Cart
    Sleep    2s
        
When User click Checkout button on Your Cart Page
    Click Element    ${your_cart_button}[checkout]

Then User navigate to Checkout: Your Information page
    Wait Until Page Contains    Checkout: Your Information

When User input First Name ${first_name}
    Input Text    ${checkout_field}[first_name]    ${first_name}
    Sleep    1s

And User input Last Name ${last_name}
    Input Text    ${checkout_field}[last_name]    ${last_name}
    Sleep    1s

And User input Zip/Postal Code ${postal_code}
    Input Text    ${checkout_field}[postal_code]    ${postal_code}
    Sleep    1s

And User click Continue button on Checkout: Your Information page
    Click Element    ${checkout_button}[continue]

Then User navigate to Checkout: Overview page
    Wait Until Page Contains    Checkout: Overview
    Sleep    2s

When User click Finish button on Checkout: Overview page
    Click Element    ${checkout_button}[finish]

Then Products successfully purchased
    Wait Until Page Contains    Checkout: Complete
    Sleep    1s

And Message "Thank you for your order" should be shown 
    Wait Until Page Contains    Thank you for your order
    Close Browser

#Didn't fill data in Your Information page
Then User failed navigate to Checkout: Overview page because see error_message ${error_message}
    Run Keyword If		'${error_message}'=='Error: First Name is required'     Wait Until Page Contains    Error: First Name is required
    Run Keyword If		'${error_message}'=='Error: Last Name is required'     Wait Until Page Contains    Error: Last Name is required
    Run Keyword If		'${error_message}'=='Error: Postal Code is required'     Wait Until Page Contains    Error: Postal Code is required
    Sleep    2s
    Close Browser