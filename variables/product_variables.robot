*** Comments ***
Type of Variables
1. Scalar Variable
Ex.
${variable_name}    variable_value
${base_url}    https://www.google.com
When mentioned in steps files:
${variable_name}
${base_url}

2. List Variable
Ex.
@{variable_name}    value_1    value_2
@{valid_credential}    admin    admin123
When mentioned in steps files:
${variable_name}[value_n]
${valid_credential}[0] for admin
${valid_credential}[1] for admin123

3. Dictionary Variable
Ex.
&{variable_name}    variable_1=value_1    variable_2=value_2    variable_3=value_3
&{valid_credential}    superadmin_user=superadmin    superadmin_pass=superadmin123    admin_user=admin    admin_pass=admin123    guest_user=guest    guest_pass=guest123
When mentioned in steps files:
${variable_name}[variable_n]
${valid_credential}[superadmin_user] for superadmin
${valid_credential}[superadmin_pass] for superadmin123

*** Variables ***
# Locator
#Product List Page
&{icon}    burger_menu=id:react-burger-menu-btn    cart=css:.shopping_cart_link    cart_badge=css:.shopping_badge_link
${product_sort}    product_sort_container
&{add_product_button}    backpack=id:add-to-cart-sauce-labs-backpack    bikelight=id:add-to-cart-sauce-labs-bike-light    boltshirt=id:add-to-cart-sauce-labs-bolt-t-shirt    fleecejacket=id:add-to-cart-sauce-labs-fleece-jacket    onesie=id:add-to-cart-sauce-labs-onesie    redtshirt=id:add-to-cart-test.allthethings()-t-shirt-(red)
&{remove_product_button}    backpack=id:remove-sauce-labs-backpack    bikelight=id:remove-sauce-labs-bike-light    boltshirt=id:remove-sauce-labs-bolt-t-shirt    fleecejacket=id:remove-sauce-labs-fleece-jacket    onesie=id:remove-sauce-labs-onesie    redtshirt=id:remove-test.allthethings()-t-shirt-(red)
&{product_name}    bikelight=css:.inventory_item_name    
# ...    bikelight=css:.item_0_title_link

#Product Detail Page
${add_product_detail_button}    add-to-cart
${remove_product_detail_button}    remove