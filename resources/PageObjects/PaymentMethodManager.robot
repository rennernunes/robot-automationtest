*** Settings ***
Library           SeleniumLibrary
Library           DateTime

*** Variables ***

${TIMEOUT_MIN}                 5s
${TIMEOUT_MED}                 10s
${TIMEOUT_MAX}                 30s

# Menu Gerenciamento de Pagamentos
${MENU_PAYMENT_METHOD}                   //a[@href='/dashboard/meios-pagamento/']
${MENU_PAYMENT_METHOD_CLICK}             (//span[contains(.,'Meios de Pagamento')])[1]
${PAYMENT_METHOD_PAGE}                   //span[contains(.,'Gerenciamento de pagamentos')]

#Tela Criação de Meio de Pagamento
${BUTTON_CREATE_PAYMENT_METHOD}          //button[contains(.,'Adicionar meio de pagamento')]
${TITLE_CREATE_PAYMENT_METHOD}           //span[contains(.,'Novo Meio de Pagamento')]
${INPUT_NAME_PAYMENT_METHOD}             css=[data-qa=paymentMethodName]
${BUTTON_SAVE_PAYMENT_METHOD}            //button[contains(.,'Salvar Meio de Pagamento')]
${TITLE_SUCESS_PAYMENT_METHOD}           //div[contains(.,'Novo Meio de Pagamento foi criado com sucesso')]
${BUTTON_GO_PAYMENT_METHOD}              //button[contains(.,'Ir para o Gerenciamento de pagamentos')]

#Habilitar toogle
${ENABLE_PAYMENT_METHOD}                (//div[@class='wrapper togl'])//span[contains(@data-qa,'toggle-')]
${ENABLE_OR_DISABLE_PAYMENT_METHOD}     (//div[@class='wrapper'])//span[contains(@data-qa,'toggle-')]

#Desabilitar toogle
${DISABLE_PAYMENT_METHOD}               (//div[@class='wrapper'])//span[contains(@data-qa,'toggle-')]
${DISABLE_PAYMENT_METHOD_BUTTON}        //button[contains(.,'Sim')]
${DISABLE_PAYMENT_METHOD_ANSWER}        //h1[contains(.,'Tem certeza de que deseja desligar o Meio de Pagamento?')]


*** Keywords ***
Dado que o usuário está na página de gerenciamento de pagamentos
    Go To                               ${BASE_URL}/dashboard
    Wait Until Element Is Visible       ${TITLE_HOME}                   ${TIMEOUT_MAX}
    Wait Until Element Is Visible       ${MENU_PAYMENT_METHOD}          ${TIMEOUT_MAX}
    Click Element                       ${MENU_PAYMENT_METHOD}
    Wait Until Element Is Visible       ${MENU_PAYMENT_METHOD_CLICK}    ${TIMEOUT_MAX}
    Click Element                       ${MENU_PAYMENT_METHOD_CLICK}
    Wait Until Element Is Visible       ${PAYMENT_METHOD_PAGE}          ${TIMEOUT_MAX}
    Sleep   2s

Quando usuário cria um meio de pagamento
    Wait Until Element Is Visible       ${BUTTON_CREATE_PAYMENT_METHOD}  ${TIMEOUT_MAX}
    Click Element                       ${BUTTON_CREATE_PAYMENT_METHOD}
    Wait Until Element Is Visible       ${TITLE_CREATE_PAYMENT_METHOD}   ${TIMEOUT_MAX}
    ${prefixo}    Set Variable    Automated
    ${string_aleatoria}    Generate Random String    5    [LETTERS]
    ${dados_gerados}    Set Variable    ${prefixo}${string_aleatoria}
    Wait Until Element Is Visible       ${INPUT_NAME_PAYMENT_METHOD}     ${TIMEOUT_MAX}
    Input Text                          ${INPUT_NAME_PAYMENT_METHOD}     ${dados_gerados}
    Log To Console                      ${dados_gerados}
    Wait Until Element Is Visible       ${BUTTON_SAVE_PAYMENT_METHOD}    ${TIMEOUT_MAX}
    Click Element                       ${BUTTON_SAVE_PAYMENT_METHOD}
    Sleep   2s

Então uma mensagem de sucesso da criação do meio de pagamento é apresentada
    Wait Until Element Is Visible       ${TITLE_SUCESS_PAYMENT_METHOD}   ${TIMEOUT_MAX}

Então o sistema exibe a página de listagem de meios de pagamento
    Wait Until Element Is Visible       ${PAYMENT_METHOD_PAGE}          ${TIMEOUT_MAX}

E é possível voltar para a página de listagem de meios de pagamento
    Wait Until Element Is Visible       ${BUTTON_GO_PAYMENT_METHOD}      ${TIMEOUT_MAX}
    Click Element                       ${BUTTON_GO_PAYMENT_METHOD}
    Sleep   2s

E o meio de pagamento é desabilitado
    Wait Until Element Is Visible       ${ENABLE_PAYMENT_METHOD}         ${TIMEOUT_MAX}
    Click Element                       ${ENABLE_PAYMENT_METHOD}
    Sleep   2s

Quando o usuário desabilita um meio de pagamento
    Wait Until Element Is Visible       ${DISABLE_PAYMENT_METHOD}           ${TIMEOUT_MAX}
    Click Element                       ${DISABLE_PAYMENT_METHOD}


Então o sistema exibe uma confirmação de desativação do meio de pagamento
    Wait Until Element Is Visible       ${DISABLE_PAYMENT_METHOD_ANSWER}    ${TIMEOUT_MAX}


E o usuário confirma a desativação do meio de pagamento
    Wait Until Element Is Visible       ${DISABLE_PAYMENT_METHOD_BUTTON}    ${TIMEOUT_MAX}
    Click Element                       ${DISABLE_PAYMENT_METHOD_BUTTON}
    Sleep   2s 

E o usuário hasabilita um meio de pagamento
    Wait Until Element Is Visible       ${ENABLE_PAYMENT_METHOD}    ${TIMEOUT_MAX}
    Click Element                       ${ENABLE_PAYMENT_METHOD}
    Sleep   2s

Quando o usuário habilita um meio de pagamento
    Quando o usuário desabilita um meio de pagamento
    Então o sistema exibe uma confirmação de desativação do meio de pagamento
    E o usuário confirma a desativação do meio de pagamento
    E o usuário hasabilita um meio de pagamento

E possui ao menos um meios de pagamento ativo ou inativo
    Wait Until Element Is Visible    ${ENABLE_OR_DISABLE_PAYMENT_METHOD}    ${TIMEOUT_MAX}

