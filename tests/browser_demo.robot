*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot  


*** Test Cases ***
Test Web Form
    New Browser    chromium    headless=No
    New Context    viewport={'width': 800, 'height': 600}
    New Page        http://localhost:5173
    #Get Title    ==    Vite App  
    Type Text    xpath=(//input[@name="username" and text()="name"])    ${Username}    delay=0.1 s 
    Type Secret    [name="password"]    $Password    delay=0.1 s
    Click With Options    [name="submit"]    delay=2 s
    #Get Text    id=message    ==    Received!
  