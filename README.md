
🧪 Tehtävä 2 –  Testauksen suorittaminen (Robot Framework)
# HYTE-Projekti – Terveyspäiväkirja

Tämä on yksinkertainen verkkopohjainen terveyspäiväkirjasovellus, jossa käyttäjä voi rekisteröityä ja kirjautua sisään. Projektissa on mukana myös automatisoitu testaus Robot Frameworkilla.

---

## 📦 Projektin rakenne (lyhyesti)

```
hyte-projekti/
├── src/                     # Sovelluksen frontend
├── public/                  # Julkiset resurssit
├── tests/                  # Robot Framework -testit
│   ├── browser_demo.robot
│   ├── diary_entry_test.robot
│   ├── web_form_test.robot
│   ├── keywords.robot
│   ├── log.html
│   └── report.html
├── .env                    # Ympäristömuuttujat (ei GitHubiin)
├── index.html              # Pääsivu
└── README.md               # Tämä tiedosto
```

---

## 🚀 Sovelluksen käynnistys

1. Asenna tarvittavat Node.js-paketit:
    ```bash
    npm install
    ```

2. Käynnistä sovellus paikallisesti:
    ```bash
    npm run dev
    ```

3. Avaa selain ja mene osoitteeseen: [http://localhost:5173](http://localhost:5173)

---

## 🤖 Testauksen suorittaminen (Robot Framework)

1. Aktivoi virtuaaliympäristö:
    ```bash
    source .venv/Scripts/activate
    ```

2. Asenna testityökalut (vain kerran):
    ```bash
    pip install robotframework robotframework-browser
    rfbrowser init
    ```

3. Suorita testi:
    ```bash
    cd tests
    robot browser_demo.robot
    ```

📝 Testin jälkeen syntyy raportit:
- `log.html` – yksityiskohtainen loki
- `report.html` – yhteenvetoraportti

---

## 🔐 Tehtävä 3 – Web Form -testaus turvallisesti

Tässä tehtävässä tutkitaan verkkolomakkeen eri kenttiä Robot Frameworkin Browser-kirjastolla.  
🔗 [Testilomake](https://www.selenium.dev/selenium/web/web-form.html)

### ✅ Testattavat elementit:
- Tekstikenttä
- Salasanakenttä
- Textarea
- Dropdown
- Datalist
- Checkbox
- Radio-napit
- File input

### 🔒 Turvallinen kirjautuminen
Käytetään `.env`-tiedostoa käyttäjätunnusten ja URL-osoitteen säilytykseen Pythonin `dotenv`-kirjaston avulla.

### 🗂️ Tiedostot:
- `web_form_test.robot` – testaa kaikki lomakekentät
- `sample.txt` – testitiedosto "file input" -kenttään
- `.env` – sisältää kirjautumistiedot
- `load_env.py` – lataa ympäristömuuttujat testiin

### ▶️ Testin ajaminen:
```bash
cd tests
robot web_form_test.robot
```

---

## 📅 Tehtävä 4 – Uuden päiväkirjamerkinnän testaus

- Testitiedosto: `tests/diary_entry_test.robot`
- Käytössä Browser Library ja ympäristömuuttujat
- BASE_URL määritellään `.env`-tiedostossa
- Tekoäly täyttää lomakkeen ja tarkistaa merkinnän näkymisen

### ▶️ Testin suoritus:
```bash
robot --outputdir outputs tests/diary_entry_test.robot
```

---

## 🧪 Testattava lomake

![Web form -testisivu][./tests/image.png]


# HYTE-Projekti – Robot Framework API-testaus(tehtävä5)

Tämä projekti sisältää esimerkin REST API -rajapinnan testaamisesta käyttäen **Robot Frameworkia** ja **RequestsLibraryä**.

---

## 🧪 Testin tarkoitus

Testi suorittaa seuraavat API-pyynnöt:

- Yksinkertainen GET-pyyntö Googleen
- GET-pyyntö parametreilla
- JSON-vastauksen hakeminen ja tarkistaminen

---

## 📦 Asennus

Luo virtuaaliympäristö (valinnainen mutta suositeltava):

```bash
python -m venv .venv
source .venv/Scripts/activate  # Windows
```

## 🤖 Quick start
Tallenna tämä tiedosto esim. login_test.robot-nimellä:
```bash
*** Settings ***
Library               RequestsLibrary

*** Test Cases ***

Quick Get Request Test
    ${response}=    GET  https://www.google.com

Quick Get Request With Parameters Test
    ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200

Quick Get A JSON Body Test
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1  ${response.json()}[id]
```
🚀 Suoritus
Aja testit komentoriviltä:

```bash
robot login_test.robot
```
## 🧾 Testitulosteet

Testin suorittamisen jälkeen Robot Framework luo automaattisesti seuraavat tiedostot:

- 📄 [`log.html`](./log.html)  
  Kattava lokitiedosto, joka näyttää jokaisen testin vaiheen ja virheet.

- 📊 [`report.html`](./report.html)  
  Yhteenvetoraportti, joka kertoo montako testiä meni läpi ja paljonko aikaa kului.

- ⚙️ [`output.xml`](./output.xml)  
  Robot Frameworkin raakadata, jota käytetään logien ja raporttien generointiin.

> 📁 Nämä tiedostot tallentuvat oletuksena siihen hakemistoon, jossa komento suoritetaan.

# Tehtävä 6:  Kirjautumistesti salatuilla arvoilla
Tässä testissä toteutettiin selainpohjainen lomaketesti Robot Frameworkilla, jossa käyttäjätunnus, salasana  olivat salattuja. Salauksen purku tapahtui automaattisesti `CryptoLibraryn` avulla.

## 🔐 Käytetyt työkalut

- [Robot Framework](https://robotframework.org/)
- [CryptoLibrary](https://github.com/robotframework/CryptoLibrary)
- [Browser-kirjasto](https://robotframework-browser.org/)
- AES-salaus testimuuttujille

## 📁 Testitiedosto
Tiedosto sijaitsee: tests/login_crypto_test.robot

## 🧪 Testin tarkoitus

```bash
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
  ```

## 🧪 Tehtävä7-Testien ajaminen 

Projektissa käytetään [Robot Frameworkia](https://robotframework.org/) testaukseen.

### 🛠 Yhden komennon testiajo

Voit ajaa kaikki testit yhdellä komennolla:

```bash

# Luo outputs-kansio, jos sitä ei ole
mkdir -p outputs

# Aja Robot Framework -testit ja ohjaa raportit outputs-kansioon
robot --output outputs/output.xml --log outputs/log.html --report outputs/report.html tests/

echo "✅ Testit suoritettu! Raportit löytyvät kansiosta: outputs/"

```
### 📝 Yhteenveto

Tässä tehtävässä siirrettiin testien raportti- ja lokitiedostot erilliseen `outputs/`-kansioon. Tämä auttaa pitämään projektin rakenteen siistinä ja helpottaa testitulosten löytämistä.

# Tehtävä8-GitHub Pages ja HTML-raportit

## 🔧 Mitä tehtiin:
Luotiin public/-kansio, johon kopioitiin testien log.html ja report.html

Ajettiin testit Robot Frameworkilla ja tallennettiin tulokset outputs/-kansioon

Kopioitiin raporttitiedostot public/-kansioon

Julkaistiin GitHub Pages -sivusto GitHubin asetuksista

Lisättiin linkit raportteihin README-tiedostoon

### Kirjoita Git Bashissa tai VSCode-terminalissa:


```bash

cp outputs/log.html public/log.html
cp outputs/report.html public/report.html
```


#### 📂 Kansiorakenne

public/

├── log.html        ✅ Testien lokiraportti

├── report.html     ✅ Testien yhteenvetoraportti

##### 🔗 Testiraportit GitHub Pages -sivulla

- ✅ [log.html (testiloki)](https://sarahussaini.github.io/Tetaus_teht/public/log.html)
- ✅ [report.html (testiraportti)](https://sarahussaini.github.io/Tetaus_teht/public/report.html)
