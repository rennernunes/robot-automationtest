*** Settings ***
Resource            ../Resource.robot

*** Variables ***

${EMAIL}                    
${PASSWORD}                 
${EMAIL_FIELD}              css=[name=loginfmt]
${PASSWORD_FIELD}           css=[name=passwd]       

${LOGIN_BUTTON}             css=[data-qa=btn-login]
${SUBMIT_BUTTON}            css=[type=submit]
${NO_BUTTON}                id=idBtn_Back

${TITLE_LOGIN}              //h3[contains(.,'Entre com a sua conta microsoft')]
${TITLE_EMAIL}              //div[@role='heading'][contains(.,'Entrar')]
${TITLE_PASSWORD}           //div[@role='heading'][contains(.,'Insira a senha')]
${TITLE_STAY_CONNECTED}     //div[@class='row text-title'][contains(.,'Continuar conectado?')]

${TITLE_HOME}               css=[data-testid=header-title]
#[id=KmsiCheckboxField]

*** Keywords ***
Abrir página de login
    [Arguments]     ${PROFILE}
    Set Base URL    ${PROFILE}    # Define a URL base com base no perfil passado
    Go To                               ${BASE_URL}/login
    Wait Until Element Is Visible       ${TITLE_LOGIN}      ${TIMEOUT_MAX}
    Click Button                        ${LOGIN_BUTTON}

Preencher campo de email com ${EMAIL}
    Wait Until Element Is Visible       ${EMAIL_FIELD}    ${TIMEOUT_MAX}
    Input Text                          ${EMAIL_FIELD}    ${EMAIL}
    Click Button                        ${SUBMIT_BUTTON}

Preencher campo de senha com ${PASSWORD}
    Wait Until Element Is Visible       ${PASSWORD_FIELD}   ${TIMEOUT_MAX}
    Input Text                          ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button                        ${SUBMIT_BUTTON}

Clicar no botão de login
    Wait Until Element Is Visible       ${NO_BUTTON}   ${TIMEOUT_MAX}
    Click Button                        ${NO_BUTTON}

Verificar redirecionamento para página inicial
    Wait Until Element Is Visible       ${TITLE_HOME}  ${TIMEOUT_MAX}

Dado que o usuário está na página de login
    Abrir página de login

Quando o usuário insere seu email e senha registrados e clica no botão de login
    Preencher campo de email com ${EMAIL}
    Preencher campo de senha com ${PASSWORD}
    Clicar no botão de login

Então o usuário deve ser redirecionado para a página inicial da plataforma de pagamento
    Verificar redirecionamento para página inicial

Realizar Login com Sucesso
    [Documentation]    Realiza o login com as credenciais registradas
    [Arguments]              ${PROFILE}
    Abrir página de login    ${PROFILE}
    Quando o usuário insere seu email e senha registrados e clica no botão de login
    Então o usuário deve ser redirecionado para a página inicial da plataforma de pagamento