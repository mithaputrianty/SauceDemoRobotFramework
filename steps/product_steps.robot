*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/product_variables.robot
Resource   ../variables/transaction_variables.robot


*** Keywords ***
# Add product from Product List page
User click Add to cart button on one of product ${product_name}
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Click Element    ${add_product_button}[backpack]
    Run Keyword If    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Click Element    ${add_product_button}[boltshirt]
    Run Keyword If    '${product_name}'=='Sauce Labs Fleece Jacket'    Click Element    ${add_product_button}[fleecejacket]
    Run Keyword If    '${product_name}'=='Sauce Labs Onesie'    Click Element    ${add_product_button}[onesie]
    Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Click Element    ${add_product_button}[bikelight]

Product ${product_name} successfully added to the cart
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Element Should Be Visible    ${remove_product_button}[backpack]
    Run Keyword If    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Element Should Be Visible    ${remove_product_button}[boltshirt]
    Run Keyword If    '${product_name}'=='Sauce Labs Fleece Jacket'    Element Should Be Visible    ${remove_product_button}[fleecejacket]
    Run Keyword If    '${product_name}'=='Sauce Labs Onesie'    Element Should Be Visible    ${remove_product_button}[onesie]
    Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Element Should Be Visible    ${remove_product_button}[bikelight]
    Sleep    2s

Cart badge will be shown
    Element Should Be Visible    ${icon}[cart_badge]
    Sleep    2s
    Close Browser

# Add product from Product Detail page
# User click one of product ${product_name}
#     Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Click Element    ${product_name}[bikelight][1]
#     Sleep    2s

# Remove product from Product List page
User click Remove button on added product ${product_name} in Product List page
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Click Element    ${remove_product_button}[backpack]
    Run Keyword If    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Click Element    ${remove_product_button}[boltshirt]
    Run Keyword If    '${product_name}'=='Sauce Labs Fleece Jacket'    Click Element    ${remove_product_button}[fleecejacket]
    Run Keyword If    '${product_name}'=='Sauce Labs Onesie'    Click Element    ${remove_product_button}[onesie]
    Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Click Element    ${remove_product_button}[bikelight]
    Sleep    2s

Product ${product_name} successfully removed from cart
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Element Should Not Be Visible    ${remove_product_button}[backpack]
    Run Keyword If    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Element Should Not Be Visible    ${remove_product_button}[boltshirt]
    Run Keyword If    '${product_name}'=='Sauce Labs Fleece Jacket'    Element Should Not Be Visible    ${remove_product_button}[fleecejacket]
    Run Keyword If    '${product_name}'=='Sauce Labs Onesie'    Element Should Not Be Visible    ${remove_product_button}[onesie]
    Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Element Should Not Be Visible    ${remove_product_button}[bikelight]
    Sleep    2s

Remove button on deleted product ${product_name} will be back to Add to cart button
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Element Should Be Visible    ${add_product_button}[backpack]
    Run Keyword If    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Element Should Be Visible    ${add_product_button}[boltshirt]
    Run Keyword If    '${product_name}'=='Sauce Labs Fleece Jacket'    Element Should Be Visible    ${add_product_button}[fleecejacket]
    Run Keyword If    '${product_name}'=='Sauce Labs Onesie'    Element Should Be Visible    ${add_product_button}[onesie]
    Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Element Should Be Visible    ${add_product_button}[bikelight]
    Sleep    2s

Cart badge will be dissapear
    Element Should Not Be Visible    ${icon}[cart_badge]
    Sleep    2s
    Close Browser

# Can't remove selected product on problem_user & error_user
Product ${product_name} can't be removed from cart
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Element Should Not Be Visible    ${add_product_button}[backpack]
    Run Keyword If    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Element Should Not Be Visible    ${add_product_button}[boltshirt]
    Run Keyword If    '${product_name}'=='Sauce Labs Fleece Jacket'    Element Should Not Be Visible    ${add_product_button}[fleecejacket]
    Run Keyword If    '${product_name}'=='Sauce Labs Onesie'    Element Should Not Be Visible    ${add_product_button}[onesie]
    Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Element Should Not Be Visible    ${add_product_button}[bikelight]
    Sleep    2s
    Close Browser

# Remove product from Cart page
User click remove button on one of product ${product_name} from Cart page
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Click Element    ${remove_product_cart_button}[backpack]
    Run Keyword If    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Click Element    ${remove_product_cart_button}[boltshirt]
    Run Keyword If    '${product_name}'=='Sauce Labs Fleece Jacket'    Click Element    ${remove_product_cart_button}[fleecejacket]
    Run Keyword If    '${product_name}'=='Sauce Labs Onesie'    Click Element    ${remove_product_cart_button}[onesie]
    Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Click Element    ${remove_product_cart_button}[bikelight]
    Sleep    2s

Product ${product_name} successfully removed from the Cart page
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Wait Until Page Does Not Contain    ${product_name}
    Run Keyword If    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Wait Until Page Does Not Contain    ${product_name}
    Run Keyword If    '${product_name}'=='Sauce Labs Fleece Jacket'    Wait Until Page Does Not Contain    ${product_name}
    Run Keyword If    '${product_name}'=='Sauce Labs Onesie'    Wait Until Page Does Not Contain    ${product_name}
    Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Wait Until Page Does Not Contain    ${product_name}    
    Sleep    2s    

Cart badge will be reduced
    Element Should Not Be Visible    ${icon}[cart_badge]
    Sleep    2s
    Close Browser

#transaction_features
And User add some items to cart until total is ${qty}
    Run Keyword If		'${qty}'=='1'     Click Element    ${add_product_button}[backpack]
    Run Keyword If		'${qty}'=='2'     Click Element    ${add_product_button}[bikelight]
    Run Keyword If		'${qty}'=='2'     Click Element    ${add_product_button}[boltshirt]
    Run Keyword If		'${qty}'=='3'     Click Element    ${add_product_button}[backpack]
    Run Keyword If		'${qty}'=='3'     Click Element    ${add_product_button}[bikelight]
    Run Keyword If		'${qty}'=='3'     Click Element    ${add_product_button}[boltshirt]
    Sleep    2s    

User click Cart icon
    Click Element    ${icon}[cart]