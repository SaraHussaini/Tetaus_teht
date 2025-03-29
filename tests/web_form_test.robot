*** Settings ***
Library     Browser    auto_closing_level=KEEP
Variables   load_env.py

*** Test Cases ***
Testaa Web Form -kenttiä turvallisesti
    New Browser    chromium    headless=No
    New Page       ${BASE_URL}
    Get Title      ==    Web form

    # Tekstikenttä
    Type Text      name=my-text         ${USERNAME}     delay=0.1 s

    # Salasana (turvallisesti .env-tiedostosta)
    Type Secret    name=my-password     $PASSWORD       delay=0.1 s

    # Textarea
    Type Text      name=my-textarea     Tämä on testiviesti.    delay=0.1 s

    # Dropdown-valinta
    Select Options By    name=my-select     value    2

    # Datalist/autocomplete
    Type Text      name=my-datalist     San Francisco    delay=0.1 s

    # Checkbox
    Check Checkbox    name=my-check

    # Radio button
    Click    xpath=//input[@type='radio' and @value='rd2']

    # Tiedoston syöttö
    Set Input Files    name=my-file    ./tests/sample.txt

    # Lähetä lomake
    Click With Options    button    delay=2 s

    # Tarkista että viesti tuli näkyviin
    Get Text    id=message    ==    Received!