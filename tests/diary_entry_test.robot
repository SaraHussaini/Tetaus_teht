*** Settings ***
Library     Browser    auto_closing_level=SUITE
Variables   ../load_env.py

*** Test Cases ***
Uusi päiväkirjamerkintä
    [Documentation]    Testaa, että käyttäjä voi lisätä uuden merkinnän päiväkirjaan
    New Browser    chromium    headless=No
    New Page       ${BASE_URL}/dairy.html

    Type Text    id=edit-date-9      2025-03-30
    Type Text    id=edit-content-9   Tämä on testimerkintä
    Click        css=button.get_entries

    Page Should Contain    Tämä on testimerkintä