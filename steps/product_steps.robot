*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/saucedemo_locators.robot
# Resource   ../variables/transaction_variables.robot
Variables    ../variables/product_locators.yaml


*** Keywords ***
# Add product from Product List page
User click Add to cart button on one of product ${product_name}
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Click Element    ${add_backpack_btn}    
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Click Element    ${add_boltshirt_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Fleece Jacket'    Click Element    ${add_fleecejacket_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Onesie'    Click Element    ${add_onesie_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bike Light'    Click Element    ${add_bikelight_btn}

Product ${product_name} successfully added to the cart
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Element Should Be Visible    ${remove_backpack_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Element Should Be Visible    ${remove_boltshirt_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Fleece Jacket'    Element Should Be Visible    ${remove_fleecejacket_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Onesie'    Element Should Be Visible    ${remove_onesie_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bike Light'    Element Should Be Visible    ${remove_bikelight_btn}
    Sleep    2s

Cart badge will be shown
    Element Should Be Visible    ${icon}[cart_badge]
    Sleep    2s

# Add product from Product Detail page
# User click one of product ${product_name}
#     Run Keyword If    '${product_name}'=='Sauce Labs Bike Light'    Click Element    ${product_name_loc}[backpack]
#     Sleep    2s

# User navigate to Product Detail page for ${product_name}
#     Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Wait Until Page Contains    ${product_name}
#     Sleep    2s

# User click Add to cart button on Product Detail page
#     Click Button    ${add_product_detail_btn}


# Remove product from Product List page
User click Remove button on added product ${product_name} in Product List page
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Click Element    ${remove_backpack_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Click Element    ${remove_boltshirt_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Fleece Jacket'    Click Element    ${remove_fleecejacket_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Onesie'    Click Element    ${remove_onesie_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bike Light'    Click Element    ${remove_bikelight_btn}
    Sleep    2s

Product ${product_name} successfully removed from cart
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Element Should Not Be Visible    ${remove_backpack_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Element Should Not Be Visible    ${remove_boltshirt_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Fleece Jacket'    Element Should Not Be Visible    ${remove_fleecejacket_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Onesie'    Element Should Not Be Visible    ${remove_onesie_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bike Light'    Element Should Not Be Visible    ${remove_bikelight_btn}
    Sleep    2s

Remove button on deleted product ${product_name} will be back to Add to cart button
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Element Should Be Visible    ${add_backpack_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Element Should Be Visible    ${add_boltshirt_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Fleece Jacket'    Element Should Be Visible    ${add_fleecejacket_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Onesie'    Element Should Be Visible    ${add_onesie_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bike Light'    Element Should Be Visible    ${add_bikelight_btn}
    Sleep    2s

Cart badge will be dissapear
    Element Should Not Be Visible    ${icon}[cart_badge]
    Sleep    2s

# Can't remove selected product on problem_user & error_user
Product ${product_name} can't be removed from cart
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Element Should Not Be Visible    ${add_backpack_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Element Should Not Be Visible    ${add_boltshirt_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Fleece Jacket'    Element Should Not Be Visible    ${add_fleecejacket_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Onesie'    Element Should Not Be Visible    ${add_onesie_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bike Light'    Element Should Not Be Visible    ${add_bikelight_btn}
    Sleep    2s

# Remove product from Cart page
User click remove button on one of product ${product_name} from Cart page
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Click Element    ${remove_backpack_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Click Element    ${remove_boltshirt_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Fleece Jacket'    Click Element    ${remove_fleecejacket_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Onesie'    Click Element    ${remove_onesie_btn}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bike Light'    Click Element    ${remove_bikelight_btn}
    Sleep    2s

Product ${product_name} successfully removed from the Cart page
    Run Keyword If    '${product_name}'=='Sauce Labs Backpack'    Wait Until Page Does Not Contain    ${product_name}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bolt T-Shirt'    Wait Until Page Does Not Contain    ${product_name}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Fleece Jacket'    Wait Until Page Does Not Contain    ${product_name}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Onesie'    Wait Until Page Does Not Contain    ${product_name}
    ...    ELSE IF    '${product_name}'=='Sauce Labs Bike Light'    Wait Until Page Does Not Contain    ${product_name}    
    Sleep    2s    

Cart badge will be reduced
    Element Should Not Be Visible    ${icon}[cart_badge]
    Sleep    2s

#transaction_features
User add some items to cart until total is ${qty}
    Run Keyword If		'${qty}'=='1'     Click Element    ${add_backpack_btn}
    ...    ELSE IF		'${qty}'=='2'     Click Element    ${add_bikelight_btn}
    ...    ELSE IF		'${qty}'=='2'     Click Element    ${add_boltshirt_btn}
    ...    ELSE IF		'${qty}'=='3'     Click Element    ${add_backpack_btn}
    ...    ELSE IF		'${qty}'=='3'     Click Element    ${add_bikelight_btn}
    ...    ELSE IF		'${qty}'=='3'     Click Element    ${add_boltshirt_btn}
    Sleep    2s    

User click Cart icon
    Click Element    ${icon}[cart]