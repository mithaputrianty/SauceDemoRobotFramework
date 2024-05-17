*** Variables ***
## Type of Variables ##
# 1. Scalar Variable
# Ex.
# ${variable_name}    variable_value
# ${base_url}    https://www.google.com
# When mentioned in steps files:
# ${variable_name}
# ${base_url}

# 2. List Variable
# Ex.
# @{variable_name}    value_1    value_2
# @{valid_credential}    admin    admin123
# When mentioned in steps files:
# ${variable_name}[value_n]
# ${valid_credential}[0] for admin
# ${valid_credential}[1] for admin123

# 3. Dictionary Variable
# Ex.
# &{variable_name}    variable_1=value_1    variable_2=value_2    variable_3=value_3
# &{valid_credential}    superadmin_user=superadmin    superadmin_pass=superadmin123    admin_user=admin    admin_pass=admin123    guest_user=guest    guest_pass=guest123
# When mentioned in steps files:
# ${variable_name}[variable_n]
# ${valid_credential}[superadmin_user] for superadmin
# ${valid_credential}[superadmin_pass] for superadmin123


# Locator
#Your Cart Page
&{your_cart_button}    checkout=id:checkout    continue_shop=id:continue-shopping    
&{remove_product_cart_button}    backpack=id:remove-sauce-labs-backpack    bikelight=id:remove-sauce-labs-bike-light    boltshirt=id:remove-sauce-labs-bolt-t-shirt    fleecejacket=id:remove-sauce-labs-fleece-jacket    onesie=id:remove-sauce-labs-onesie    redtshirt=id:remove-test.allthethings()-t-shirt-(red)

#Checkout: Your Information Page
&{checkout_field}    first_name=id:first-name    last_name=id:last-name    postal_code=id:postal-code
&{checkout_button}    continue=id:continue    cancel=id:cancel

#Checkout: Overview Page
&{overview_page}    finish=id:finish    cancel=id:cancel

#Checkout: Complete! Page
&{complete_page}    back_home=id:back-to-products