🧪 Tehtävä 2 –  Testauksen suorittaminen (Robot Framework)
# HYTE-Projekti – Terveyspäiväkirja

Tämä on yksinkertainen verkkopohjainen terveyspäiväkirjasovellus, jossa käyttäjä voi rekisteröityä ja kirjautua sisään.  
Projektissa on myös automatisoitu testaus Robot Frameworkilla.

---

## 🖥️ Sovelluksen käynnistys

1. Asenna tarvittavat Node.js-paketit:

```bash
npm install
2.Käynnistä sovellus paikallisesti:   `npm run dev`
3. Avaa selain ja mene osoitteeseen: [http://localhost:5173](http://localhost:5173)

🧪 Testauksen suorittaminen (Robot Framework)
1.Aktivoi virtuaaliympäristö: source .venv/Scripts/activate
2. Asenna testityökalut (vain kerran): pip install robotframework robotframework-browser
rfbrowser init
3. Suorita testi: cd tests  robot browser_demo.robot

Testin jälkeen syntyy raportit:

     -log.html – yksityiskohtainen loki

     -report.html – yhteenvetoraportti

🗂 Projektin rakenne (lyhyesti)
hyte-projekti/
├── src/            # Sovelluksen frontend
├── public/         # Julkiset resurssit
├── tests/          # Robot Framework -testit
│   ├── browser_demo.robot
│   ├── Keywords.robot
│   └── log.html, report.html...
├── index.html      # Pääsivu
├── README.md       # Tämä tiedosto

🧪 Tehtävä 3 – Web Form -testaus turvallisesti
Tässä tehtävässä tutkitaan Robot Frameworkin Browser-kirjaston avulla verkkolomakkeen (Web Form) eri kenttien toimivuutta. Testisivuna käytetään Seleniumin tarjoamaa esimerkkisivua:
🔗 https://www.selenium.dev/selenium/web/web-form.html

🧩 Testattavat elementit:
Tekstikenttä
Salasanakenttä
Textarea (monirivinen tekstikenttä)
Dropdown (valintalista)
Datalist (automaattitäydennys)
Checkbox (valintaruutu)
Radio-napit

Tiedoston valinta (file input)

🔐 Turvallinen kirjautuminen
Salasana ja käyttäjätunnus haetaan suojatusti .env-tiedostosta Pythonin dotenv-kirjaston avulla, eikä niitä kirjoiteta suoraan testikoodiin.

🔧 Tiedostot:
web_form_test.robot: testitapaus, joka käy läpi kaikki kentät

sample.txt: testitiedosto, jota käytetään "File input" -kentässä

.env: sisältää kirjautumistiedot ja testisivun osoitteen

load_env.py: lataa .env-tiedoston ja tekee muuttujat Robot Frameworkille

✅ Testin ajaminen  cd tests robot web_form_test.robot

### 🔍 Testattava lomake:
Tuolos:
![Web form -testisivu](./tests/image.png)

## Tehtävä 4 – Uuden päiväkirjamerkinnän testaaminen

- Testitiedosto: `tests/diary_entry_test.robot`
- Testissä käytetään Browser Librarya ja ympäristömuuttujia.
- `BASE_URL` määritellään `.env`-tiedostossa, jota ei tallenneta GitHubiin.
- Selaimen ollessa päällä testi täyttää päiväkirjalomakkeen ja tarkistaa, että merkintä näkyy.

Testin suorituskomento: robot --outputdir outputs tests/diary_entry_test.robot

