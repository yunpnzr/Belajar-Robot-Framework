*** Settings ***
Resource    ../settings/settings.robot
#Suite Setup    Open Browser    ${WebSauceDemo}     ${BROWSER}
#Suite Teardown    Close Browser
Variables    ../resource/login_locators.yaml

*** Variables ***

*** Keywords ***
Input Username User
    Input Text    ${textUsername}    standard_user
Input Password User
    Input Text    ${textPassword}    secret_sauce
Click Button Login
    Click Element    ${btnLogin}
    Sleep    1s
Verify Login Page
    Page Should Contain    Products
Input Invalid Username User
    Input Text    ${textUsername}    standard_admin
Verify Error Alert Show
    Page Should Contain Element    ${textAlert}

*** Test Cases ***
Verify Login Success
    [Setup]    Open Browser    ${WebSauceDemo}    ${BROWSER}
    Input Username User
    Input Password User
    Click Button Login
    Verify Login Page
    [Teardown]    Close Browser

Verify Login Failed With Invalid Username
    [Setup]    Open Browser    ${WebSauceDemo}    ${BROWSER}
    Input Invalid Username User
    Input Password User
    Click Button Login
    Verify Error Alert Show
    [Teardown]    Close Browser