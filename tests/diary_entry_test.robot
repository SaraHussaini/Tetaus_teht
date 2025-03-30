*** Settings ***
Library     Browser    auto_closing_level=SUITE
Variables   ../load_env.py

*** Test Cases ***
Uusi päiväkirjamerkintä
    [Documentation]    Testaa, että käyttäjä voi lisätä uuden merkinnän päiväkirjaan
    New Browser    chromium    headless=No
    New Page       ${BASE_URL}/dairy.html

    # Täytä lomake
    Type Text    id=edit-date-9      2025-03-30
    Type Text    id=edit-content-9   Tämä on testimerkintä

    # Lähetä lomake
    Click        css=button.get_entries

    # Tarkista että merkintä ilmestyy
    Wait For Elements State    css=.entry-item    visible    timeout=5s
    Page Should Contain        Tämä on testimerkintä
