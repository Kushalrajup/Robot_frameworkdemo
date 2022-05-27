*** Settings ***
Library  SeleniumLibrary
Library    XML
Library    OperatingSystem

*** Variables ***
${url}  https://www.google.co.in
${browser}  Chrome
${file}  Textfile.txt

*** Test Cases ***
TestCase
    Open Browser   ${url}    ${browser}
    Maximize Browser Window
    Delete All Cookies
    Input Text    name:q  robotframework
    Submit Form
    ${aa}=   Get WebElements    //div[@class="yuRUbf"]
    Create File    ${file}

    FOR    ${el}    IN    @{aa}
        ${text}=    Get Text   ${el}
        Log To Console   ${text}
        Append To File    ${file}    ${text}
    END


    Capture Page Screenshot    Automatic_screenshot.png
    Set Selenium Implicit Wait    10s
    Close Browser




*** Keywords ***


