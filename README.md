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