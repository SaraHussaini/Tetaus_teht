*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://127.0.0.1:3000

*** Test Cases ***

[Setup]    Create Session    hyte    ${BASE_URL}

Test 1 – API Is Reachable
    ${resp}=    GET    hyte    /
    Should Be Equal As Integers    ${resp.status_code}    200

Test 2 – User Registration
    ${user}=    Create Dictionary
    ...    username=Parvanehh
    ...    password=x1234567212
    ...    email=xhx@example.fiii
    ${resp}=    POST    hyte    /api/auth/register    json=${user}
    Should Be True    ${resp.status_code} == 201 or ${resp.status_code} == 409

Test 3 – Login and Get Token
    ${login_data}=    Create Dictionary
    ...    username=Parvanehh
    ...    password=x1234567212
    ${resp}=    POST    hyte    /api/auth/login    json=${login_data}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${token}=    Set Variable    ${resp.json()}[token]

Test 4 – Add Diary Entry
    ${entry}=    Create Dictionary
    ...    title=Robot Entry
    ...    content=This was added by Robot Framework
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${resp}=    POST    hyte    /api/entries    headers=${headers}    json=${entry}
    Should Be Equal As Integers    ${resp.status_code}    201

Test 5 – Get Diary Entries
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${resp}=    GET    hyte    /api/entries    headers=${headers}
    Should Be Equal As Integers    ${resp.status_code}    200

