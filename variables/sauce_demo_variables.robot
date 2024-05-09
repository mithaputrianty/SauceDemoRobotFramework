*** Variables ***

#Scalar Variable
${base_url}    https://www.saucedemo.com/

#List Variable
@{standard_user}    standard_user    secret_sauce

#Dictionary Variable
&{browser}    Chrome=chrome    Firefox=firefox    Edge=edge

# locator
#Login Page
&{login_field}    username=id:user-name    password=id:password
&{login_button}    login_button=id:login-button

#Product Page
&{add_product_button}    backpack=id:add-to-cart-sauce-labs-backpack    bikelight=id:add-to-cart-sauce-labs-bike-light    boltshirt=id:add-to-cart-sauce-labs-bolt-t-shirt
&{icon}    cart=css:.shopping_cart_link

#Your Cart Page
&{your_cart_button}    checkout=id:checkout

#Checkout Page
&{checkout_field}    first_name=id:first-name    last_name=id:last-name    postal_code=id:postal-code
&{checkout_button}    continue=id:continue    finish=id:finish