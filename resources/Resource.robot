*** Settings ***
Documentation       Configuração de execução
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}        chrome
${MODE_BROWSER}   ${EMPTY}
${BASE_URL}       ${URL_DEV}   # URL padrão, pode ser qualquer um dos perfis disponíveis, passando -v PROFILE:QA
${PROFILE}        DEV          # Perfil padrão, pode ser qualquer um dos perfis disponíveis, por exemplo: DEV, QA, STG, PROD
${URL_DEV}        https://
${URL_QA}         https://
${URL_STG}        https://
${URL_PROD}       https://
${TIMEOUT_MIN}                 5s
${TIMEOUT_MED}                 10s
${TIMEOUT_MAX}                 20s


*** Keywords ***

Set Base URL
    [Arguments]        ${PROFILE}
    Run Keyword If    '${PROFILE}' == 'DEV'    Set Global Variable    ${BASE_URL}    ${URL_DEV}
    ...    ELSE IF    '${PROFILE}' == 'QA'     Set Global Variable    ${BASE_URL}    ${URL_QA}
    ...    ELSE IF    '${PROFILE}' == 'STG'    Set Global Variable    ${BASE_URL}    ${URL_STG}
    ...    ELSE IF    '${PROFILE}' == 'PROD'   Set Global Variable    ${BASE_URL}    ${URL_PROD}
    ...    ELSE        Fail    Invalid profile: ${PROFILE}

#### Setup e Teardown
# Abrir navegador
#     Open Browser       about:blank   ${BROWSER}
#     Maximize Browser Window

Abrir Navegador
    IF  '${MODE_BROWSER}'=="headless"
        Chrome Headless
    ELSE IF     '${MODE_BROWSER}'=='${EMPTY}'
        Chrome Front
    END
    Maximize Browser Window

Chrome Headless
    ${chrome_options}=      Evaluate        sys.modules['selenium.webdriver'].ChromeOptions()       sys, selenium.webdriver
    Call Method     ${chrome_options}       add_argument        --disable-extensions
    Call Method     ${chrome_options}       add_argument        --headless
    Call Method     ${chrome_options}       add_argument        --disable-gpu
    Call Method     ${chrome_options}       add_argument        --no-sandbox
    Call Method     ${chrome_options}       add_argument        --lang\=pt-BR
    &{prefs}=    Create Dictionary    intl.accept_languages=pt-BR
    Call Method    ${chrome_options}     add_experimental_option    prefs    ${prefs}
    ${driver}=      Create Webdriver    Chrome
    ...             options=${chrome_options}
    Set Window Size    1920    1080   # Defina a largura e altura desejadas

Chrome Front
    Open Browser       about:blank   ${BROWSER}

Fechar navegador
    Capture Page Screenshot
    Close Browser
