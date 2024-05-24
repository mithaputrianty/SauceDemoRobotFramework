*** Variables ***
# Base URL
${base_url}    https://www.saucedemo.com/

# Browser
&{browser}    Chrome=chrome    Firefox=firefox    Edge=edge

# Credential
&{username}    standard_user=standard_user    problem_user=problem_user    performance_glitch_user=performance_glitch_user    error_user=error_user    visual_user=visual_user
${locked_out_user}    locked_out_user


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