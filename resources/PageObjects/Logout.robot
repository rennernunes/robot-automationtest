*** Settings ***
Resource            ../Resource.robot

*** Variables ***
${EXIT_BUTTON}              css=[data-qa=exit-menu-item]
${CONFIRMATION_MESSAGE}     css=[data-qa=confirmation-message]
${TITLE_WELCOME}            //h1[contains(.,'Bem vindo!')]

*** Keywords ***
Abrir página de pagamento
    Go To                               ${BASE_URL}/dashboard
    Wait Until Element Is Visible       ${TITLE_HOME}   ${TIMEOUT_MAX}

Clicar no botão sair
    Click Element                       ${EXIT_BUTTON}

Verificar exibição da mensagem de confirmação
    Wait Until Element Is Visible       ${TITLE_WELCOME}    ${TIMEOUT_MAX}

Dado que o usuário está na plataforma de pagamento
    Abrir página de pagamento
Quando o usuário clica no botão sair
    Clicar no botão sair
Então uma mensagem de confirmação deve ser exibida em até 2 segundos
    Verificar exibição da mensagem de confirmação