*** Settings ***
Library           SeleniumLibrary
Library           DateTime

*** Variables ***

${TIMEOUT_MIN}                 5s
${TIMEOUT_MED}                 10s
${TIMEOUT_MAX}                 30s

# Menu Gerenciamento de Gateway
${MENU_GATEWAY}                   //a[@href='/dashboard/gateway/']  #css=[data-qa=payments-menu-item]
${MENU_GATEWAY_CLICK}             (//span[contains(.,'Gateway')])[1]
${GATEWAY}                        //span[contains(.,'Gerenciamento de Gateway')]

#Tela Criação de Gateway
${BUTTON_CREATE_GATEWAY}          css=[data-qa=gateway-button]
${TITLE_CREATE_GATEWAY}           //span[contains(.,'Novo Gateway')]
${INPUT_NAME_GATEWAY}             css=[data-qa=gateway-name]
${INPUT_DESCRIPTION_GATEWAY} 
${BUTTON_SAVE_GATEWAY}            //button[contains(.,'Salvar novo Gateway')]
${TITLE_SUCESS_GATEWAY}           //div[contains(.,'Novo Gateway foi adicionado com sucesso')]
${BUTTON_GO_GATEWAY}              //span[contains(.,'Voltar para o Gerenciamento de gateway')]

#Habilitar toogle
${ENABLE_GATEWAY}                (//div[contains(@class,'wrapper togl')])[1]//span[contains(@data-qa,'toggle-')]
${ENABLE_OR_DISABLE_GATEWAY}     (//div[contains(@class,'wrapper')])//span[contains(@data-qa,'toggle-')]

#Desabilitar toogle
${DISABLE_GATEWAY}               (//div[contains(@class,'wrapper')])[1]//span[contains(@data-qa,'toggle-')]
${DISABLE_GATEWAY_BUTTON}        //button[contains(.,'Sim')]
${DISABLE_GATEWAY_ANSWER}        //h1[contains(.,'Tem certeza que deseja desabilitar o Gateway?')]

#Editar gateway
${TITLE_EDIT_GATEWAY}           //span[contains(.,'Editando Gateway')]
${EDIT_GATEWAY}                 (//img[contains(@alt,'editar gateway')])[1]
${PUBLIC_KEY}                   css=[data-qa=public-key]
${BUTTON_SAVE_EDIT_GATEWAY}     //button[contains(.,'Salvar Gateway')]
${TITLE_SUCESS_EDIT_GATEWAY}    //div[contains(.,'Gateway atualizado com sucesso!')]

*** Keywords ***
Abrir página de gerenciamento de gateway
    Go To                               ${BASE_URL}/dashboard
    Wait Until Element Is Visible       ${TITLE_HOME}           ${TIMEOUT_MAX}
    Wait Until Element Is Visible       ${MENU_GATEWAY}        ${TIMEOUT_MAX}
    Click Element                       ${MENU_GATEWAY}
    Wait Until Element Is Visible       ${MENU_GATEWAY_CLICK}  ${TIMEOUT_MAX}
    Click Element                       ${MENU_GATEWAY_CLICK}
    Wait Until Element Is Visible       ${GATEWAY}              ${TIMEOUT_MAX}    
    Sleep   2s   

Criar um novo gateway de pagamentos
    Wait Until Element Is Visible       ${BUTTON_CREATE_GATEWAY}   ${TIMEOUT_MAX}  
    Click Element                       ${BUTTON_CREATE_GATEWAY}
    Wait Until Element Is Visible       ${TITLE_CREATE_GATEWAY}     ${TIMEOUT_MAX}
    ${prefixo}    Set Variable    Automated
    ${string_aleatoria}    Generate Random String    5    [LETTERS]
    ${dados_gerados}    Set Variable    ${prefixo}${string_aleatoria}
    Wait Until Element Is Visible       ${INPUT_NAME_GATEWAY}           ${TIMEOUT_MAX}
    Input Text                          ${INPUT_NAME_GATEWAY}           ${dados_gerados}
    Log To Console                      ${dados_gerados}
    Wait Until Element Is Visible       ${BUTTON_SAVE_GATEWAY}           ${TIMEOUT_MAX}
    Click Element                       ${BUTTON_SAVE_GATEWAY}

Habilitar gateway desativado
    Wait Until Element Is Visible       ${ENABLE_GATEWAY}           ${TIMEOUT_MAX}
    Click Element                       ${ENABLE_GATEWAY}
    Sleep   2s

Desabilitar gateway habilitado
    Wait Until Element Is Visible       ${DISABLE_GATEWAY}           ${TIMEOUT_MAX}
    Click Element                       ${DISABLE_GATEWAY}
    Wait Until Element Is Visible       ${DISABLE_GATEWAY_ANSWER}           ${TIMEOUT_MAX}
    Click Element                       ${DISABLE_GATEWAY_BUTTON}
    Sleep   2s

Dado que o usuário está na página de gerenciamento de gateways
    Abrir página de gerenciamento de gateway    

Quando o usuário cria um gateway
    Criar um novo gateway de pagamentos

Quando o usuário desabilita um gateway
    Desabilitar gateway habilitado
 
Quando o usuário edita um gateway
    Scroll Element Into View            ${EDIT_GATEWAY}
    Wait Until Element Is Visible       ${EDIT_GATEWAY}           ${TIMEOUT_MAX}
    Click Element                       ${EDIT_GATEWAY}
    Wait Until Element Is Visible       ${TITLE_EDIT_GATEWAY}           ${TIMEOUT_MAX}
    Sleep   2s
    Wait Until Element Is Visible       ${PUBLIC_KEY}           ${TIMEOUT_MAX}
    ${string_aleatoria}=    Generate Random String    10    [NUMBERS]
    Input Text    ${PUBLIC_KEY}    ${string_aleatoria}
    Wait Until Element Is Visible       ${BUTTON_SAVE_EDIT_GATEWAY}           ${TIMEOUT_MAX}
    Click Element                       ${BUTTON_SAVE_EDIT_GATEWAY}
    

E o gateway é habilitado
    Habilitar gateway desativado

E é possível voltar para a página de listagem de gateways
    Wait Until Element Is Visible       ${BUTTON_GO_GATEWAY}        ${TIMEOUT_MAX}
    Click Element                       ${BUTTON_GO_GATEWAY}
    Sleep   2s

E possui ao menos um gateway ativo ou inativo
    Wait Until Element Is Visible    ${ENABLE_OR_DISABLE_GATEWAY}  ${TIMEOUT_MAX}
 
Então o sistema exibe a página de listagem de gateways
    Wait Until Element Is Visible       ${GATEWAY}              ${TIMEOUT_MAX}
    
Então uma mensagem de confirmação é apresentada
    Wait Until Element Is Visible       ${TITLE_SUCESS_GATEWAY}     ${TIMEOUT_MAX}

Então uma mensagem de sucesso da edição é apresentada
    Wait Until Element Is Visible       ${TITLE_SUCESS_EDIT_GATEWAY}     ${TIMEOUT_MAX}
    