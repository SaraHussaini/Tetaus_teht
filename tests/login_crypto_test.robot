*** Settings ***
Library     Browser    auto_closing_level=SUITE
Library     CryptoLibrary    variable_decryption=True   #Kryptatut muuttujat puretaan automaattisesti

*** Variables ***
${Username}    crypt:+PVwFu9YNNeNuxyFc8tY9rHUBVuwR5j008OUELX052RrrQ5waDmSIm5L7FcYqBKZCGhPNJ9EFGBq
${Password}    crypt:4BkaR/J3AIdBbB1qxYn8tjqo/eo6Cg5w5mPYFGGM7DjXuBDPfax4sbxOvNCCiqFQUQMY9b5GruUOdno= 

#Public Key: m7eYE5eGCSnIFeJqOdYTpAle64Y9790Vp92VSKfQfxM=

*** Test Cases ***
Test Web Form
    New Browser    chromium    headless=No
    New Context    viewport={'width': 800, 'height': 600}
    New Page      http://localhost:5173
    #Get Title    ==    Vite App  
    Type Text    xpath=(//input[@name="username" and text()="name"])    ${Username}    delay=0.1 s 
    Type Secret    [name="password"]    $Password    delay=0.1 s
    Click With Options    [name="submit"]    delay=2 s
    #Get Text    id=message    ==    Received!
  