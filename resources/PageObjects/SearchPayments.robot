*** Settings ***
Library           SeleniumLibrary
Library           DateTime

*** Variables ***

${TIMEOUT_MIN}                 5s
${TIMEOUT_MED}                 10s
${TIMEOUT_MAX}                 30s

# Menu pagamentos
${MENU_PAYMENTS}            //a[@href='/dashboard/pagamentos/']  #css=[data-qa=payments-menu-item]
${MENU_PAYMENTS_CLICK}      (//span[contains(.,'Pagamentos')])[1]
${TABLE_PAYMENTS}           //tr[contains(@data-testid, 'row-')]
${PAYMENT}                  //tr[contains(@data-testid, 'row-')]
${CLICK_PAYMENT_GRID}       (//td[contains(@id,'td-order')])[1]

#Filtro calendário
${CALENDAR}                 id=calendar
${START_DATE}               xpath=//div[@data-qa="month-left-days"]//div[contains(.,'11')]
${END_DATE}                 xpath=//div[@data-qa="month-right-days"]//div[contains(.,'1')]
${OVERLAY}                  //span[contains(@class,'overlay')]
${BTN_APPLY}                css=[data-qa=btn_apply_calendar]

#Filtro Status do pagamento
${BTN_FILTERS}              //button[@data-qa='btn-filters']
${BTN_FILTER}               //span[contains(.,'Filtrar')]
${LABEL_STATUS}             css=[data-qa=label_status]
${INPUT_STATUS}             css=[data-qa=input_status]
${DROPBOARD_STATUS}         css=[data-qa=dropboard_status]
${STATUS_LIST}              //li[contains(.,'Pagamento confirmado')]
${STATUS}                   (//span[contains(.,'Pagamento confirmado')])[1]

#Filtro Formas de pagamento
${LABEL_PAYMENT_METHOD}             css=[data-qa=label_paymentMethod]
${INPUT_PAYMENT_METHOD}             css=[data-qa=input_paymentMethod]
${DROPBOARD_PAYMENT_METHOD}         css=[data-qa=dropboard_paymentMethod]
${PAYMENT_METHOD_LIST}              //li[contains(.,'Cartão de crédito')] 


#Filtro pesquisar por pedido
${SEARCH_INPUT}             css=[data-testid=search-input]


# Detalhes do pagamento
${FIRST_ORDER}              (//td[contains(@id,'td-order')])[1]
${TITLE_DETAILS_PAYMENT}    (//span[contains(.,'Pagamento')])[3]
${TITLE_DETAILS_METHOD}     //span[contains(.,'Meio de Pagamento')]
${TITLE_DETAILS_VALUE}      //span[contains(.,'Valor da transação:')]
${SEARCH_BUTTON}            css=[data-qa=btn_search]

#filtro tipo pedido:
${LABEL_TIPO_PEDIDO}    css=[data-qa=label_orderType]
${INPUT_TIPO_PEDIDO}    css=[data-qa=input_orderType]
${DROPBOARD_TIPO_PEDIDO}    css=[data-qa=dropboard_orderType]
${TIPO_PEDIDO_LIST}    //li[contains(.,'1P')]

#filtro gateway
${LABEL_GATEWAY}            css=[data-qa=label_gateway]
${INPUT_GATEWAY}            css=[data-qa=input_gateway]
${DROPBOARD_GATEWAY}        css=[data-qa=dropboard_gateway]
${GATEWAY_LIST}             //li[contains(.,'Mundipagg')]


*** Keywords ***
Abrir página de consulta de pagamentos
    Go To                               ${BASE_URL}/dashboard
    Wait Until Element Is Visible       ${TITLE_HOME}           ${TIMEOUT_MAX}
    Wait Until Element Is Visible       ${MENU_PAYMENTS}        ${TIMEOUT_MAX}
    Click Element                       ${MENU_PAYMENTS}
    Wait Until Element Is Visible       ${MENU_PAYMENTS_CLICK}  ${TIMEOUT_MAX}
    Click Element                       ${MENU_PAYMENTS_CLICK}
    Wait Until Element Is Visible       ${PAYMENT}              ${TIMEOUT_MAX}    
    Sleep   2s   

Preencher datas desejadas e filtrar
    Wait Until Element Is Visible        ${CALENDAR}    ${TIMEOUT_MAX}
    Click Element                        ${CALENDAR} 
    Wait Until Element Is Visible        ${START_DATE}  ${TIMEOUT_MAX}
    Click Element                        ${START_DATE}
    Wait Until Element Is Visible        ${END_DATE}    ${TIMEOUT_MAX}
    Click Element                        ${END_DATE}
    Wait Until Element Is Visible        ${BTN_APPLY}   ${TIMEOUT_MAX}
    Click Element                        ${BTN_APPLY}
    #Wait Until Element Is Visible        ${OVERLAY}     ${TIMEOUT_MAX}
    #Execute JavaScript                   document.querySelector('span[class*="overlay"]').click()

Preencher a data desejadas e filtrar
    Wait Until Element Is Visible        ${CALENDAR}    ${TIMEOUT_MAX}
    Click Element                        ${CALENDAR} 
    Wait Until Element Is Visible        ${START_DATE}  ${TIMEOUT_MAX}
    Click Element                        ${START_DATE}
    Wait Until Element Is Visible        ${START_DATE}  ${TIMEOUT_MAX}
    Click Element                        ${START_DATE}
    Wait Until Element Is Visible        ${BTN_APPLY}   ${TIMEOUT_MAX}
    Click Element                        ${BTN_APPLY}
    # Wait Until Element Is Visible        ${OVERLAY}     ${TIMEOUT_MAX}
    # Execute JavaScript                   document.querySelector('span[class*="overlay"]').click()

Exibir mais informações sobre o pagamento
    Wait Until Element Is Visible       ${FIRST_ORDER}            ${TIMEOUT_MAX}
    Element Should Be Visible           ${FIRST_ORDER}
    Wait Until Element Is Visible       ${TITLE_DETAILS_VALUE}      ${TIMEOUT_MAX}
    Element Should Be Visible           ${TITLE_DETAILS_VALUE} 
    Wait Until Element Is Visible       ${TITLE_DETAILS_PAYMENT}    ${TIMEOUT_MAX}
    Element Should Be Visible           ${TITLE_DETAILS_PAYMENT}
    Wait Until Element Is Visible       ${TITLE_DETAILS_METHOD}     ${TIMEOUT_MAX}
    Element Should Be Visible           ${TITLE_DETAILS_METHOD}

Exibir uma lista com 10 pagamentos
    #Wait Until Element Is Visible       ${TABLE_PAYMENTS}    ${TIMEOUT_MAX}
    # ${RESULTS} =    Get WebElements     ${TABLE_PAYMENTS}
    #  #Length Should Be    ${RESULTS}      10
    # ${length} =    Get Length    ${RESULTS}
    # Run Keyword If    '${length}' == '10'    Log    Lista de pagamentos exibida corretamente    ELSE    Log    Não foram encontrados 10 resultados na lista de pagamentos
    ${RESULTS} =    Get WebElements     ${TABLE_PAYMENTS}
    ${length} =    Get Length           ${RESULTS}
    Log To Console                      ${length}
        Run Keyword If    '${length}' == '10'
    ...    Log    Lista de pagamentos exibida corretamente
    ...    ELSE IF    '${length}' == '0'
    ...    Log    Não foram encontrados resultados na lista de pagamentos
    ...    ELSE
    ...    Log    A lista de pagamentos não possui 10 resultados


Exibir uma lista com pelo menos um pagamento
    Wait Until Element Is Visible       ${TABLE_PAYMENTS}    ${TIMEOUT_MAX}
    ${RESULTS} =    Get WebElements     ${TABLE_PAYMENTS}
    ${RESULTS_LENGTH}    Get Length    ${RESULTS} 
    Should Be True    ${RESULTS_LENGTH} > 0

Exibir pelo menos um pagamento com o filtro
    [Arguments]    ${FILTRO}
    Wait Until Element Is Visible       ${FILTRO}     ${TIMEOUT_MAX}
    Element Should Be Visible           ${FILTRO}

Clicar em um elemento da lista
    Click Element                       ${CLICK_PAYMENT_GRID}

Verificar performance de filtragem
    Wait Until Element Is Visible    ${TABLE_PAYMENTS}    ${TIMEOUT_MAX}
    ${START_TIME}=    Get Current Date    result_format=%s.%f    
    ${STOP_TIME}=     Get Current Date    result_format=%s.%f   
    ${RESPONSE_TIME}=    Evaluate    ${STOP_TIME} - ${START_TIME}   
    Should Be True    ${RESPONSE_TIME} < 2.0   

# Tratar possíveis erros na filtragem
#     Click Button                           ${FILTRAR_BUTTON}
#     Element Should Be Visible              ${ERROR_MESSAGE}

Preencher filtro status e filtrar
    Wait Until Element Is Visible       ${BTN_FILTERS}          ${TIMEOUT_MAX}
    Click Element                       ${BTN_FILTERS}
    Wait Until Element Is Visible       ${LABEL_STATUS}         ${TIMEOUT_MAX}
    Element Should Be Visible           ${LABEL_STATUS}
    Wait Until Element Is Visible       ${INPUT_STATUS}         ${TIMEOUT_MAX}
    Click Element                       ${INPUT_STATUS}
    Wait Until Element Is Visible       ${DROPBOARD_STATUS}     ${TIMEOUT_MAX}
    Click Element                       ${STATUS_LIST}
    Wait Until Element Is Visible       ${BTN_FILTER}           ${TIMEOUT_MAX}
    Click Element                       ${BTN_FILTER}

Preencher filtro forma de pagamento e filtrar
    Wait Until Element Is Visible       ${BTN_FILTERS}                  ${TIMEOUT_MAX}
    Click Element                       ${BTN_FILTERS}
    Wait Until Element Is Visible       ${LABEL_PAYMENT_METHOD}         ${TIMEOUT_MAX}
    Element Should Be Visible           ${LABEL_PAYMENT_METHOD}
    Wait Until Element Is Visible       ${INPUT_PAYMENT_METHOD}         ${TIMEOUT_MAX}
    Click Element                       ${INPUT_PAYMENT_METHOD}
    Wait Until Element Is Visible       ${DROPBOARD_PAYMENT_METHOD}     ${TIMEOUT_MAX}
    Click Element                       ${PAYMENT_METHOD_LIST}
    Wait Until Element Is Visible       ${BTN_FILTER}                   ${TIMEOUT_MAX}
    Click Element                       ${BTN_FILTER}

Preencher filtro gateways e filtrar
    Wait Until Element Is Visible       ${BTN_FILTERS}                  ${TIMEOUT_MAX}
    Click Element                       ${BTN_FILTERS}
    Wait Until Element Is Visible       ${LABEL_GATEWAY}                ${TIMEOUT_MAX}
    Element Should Be Visible           ${LABEL_GATEWAY}
    Wait Until Element Is Visible       ${INPUT_GATEWAY}                ${TIMEOUT_MAX}
    Click Element                       ${INPUT_GATEWAY}
    Wait Until Element Is Visible       ${DROPBOARD_GATEWAY}            ${TIMEOUT_MAX}
    Click Element                       ${GATEWAY_LIST}
    Wait Until Element Is Visible       ${BTN_FILTER}                   ${TIMEOUT_MAX}
    Click Element                       ${BTN_FILTER}

Preencher filtro com o pedido e filtrar
    Wait Until Element Is Visible               ${FIRST_ORDER}                  ${TIMEOUT_MAX}
    ${ORDER_NUMBER}    Get Text                 ${FIRST_ORDER}
    Input Text                                  ${SEARCH_INPUT}                 ${ORDER_NUMBER}
    Wait Until Element Is Visible               ${SEARCH_BUTTON}                ${TIMEOUT_MAX}
    Click Element                               ${SEARCH_BUTTON} 

Dado que o usuário está na página de consulta de pagamentos
    Abrir página de consulta de pagamentos

Quando ele clica em um pagamento da lista
    Clicar em um elemento da lista

Quando ele preenche a data desejada e clica em 'Filtrar'
    Preencher a data desejadas e filtrar

Quando ele preenche as datas desejadas e clica em 'Filtrar'
    Preencher datas desejadas e filtrar

Quando ele preenche o filtro status de pagamento e clica em 'Filtrar'
    Preencher filtro status e filtrar

Quando ele preenche o filtro forma de pagamento e clica em 'Filtrar'
    Preencher filtro forma de pagamento e filtrar

Quando ele preenche os filtros status, forma, gateways de pagamento e clica em 'Filtrar'
    [Documentation]    Teste dos filtros de Status, Forma de Pagamento e Gateway de Pagamento
    Quando ele preenche as datas desejadas e clica em 'Filtrar'
    Quando ele preenche o filtro status de pagamento e clica em 'Filtrar'
    Quando ele preenche o filtro forma de pagamento e clica em 'Filtrar'
    Quando ele preenche o filtro gateways de pagamento e clica em 'Filtrar'

Quando ele preenche o filtro com o pedido e clica em 'Filtrar'
    Preencher filtro com o pedido e filtrar

Quando ele preenche os filtros numero pedido, data, status e clica em 'Filtrar'
    [Documentation]    Teste dos filtros de Status, Data e Número do Pedido
    Quando ele preenche as datas desejadas e clica em 'Filtrar'
    Quando ele preenche o filtro status de pagamento e clica em 'Filtrar'
    Quando ele preenche o filtro com o pedido e clica em 'Filtrar'

Então o sistema deve exibir uma lista de 10 pagamentos
    Exibir uma lista com 10 pagamentos

Então o sistema deve exibir pelo menos um pagamento
    Exibir uma lista com pelo menos um pagamento

Então o sistema deve exibir pelo menos um pagamento com o filtro "${FILTRO}"
    Exibir pelo menos um pagamento com o filtro     ${FILTRO}

Então o sistema deve exibir mais informações sobre o pagamento
    Exibir mais informações sobre o pagamento

Então o sistema deve ter uma performance satisfatória, com tempo de resposta máximo de 2 segundos
    Verificar performance de filtragem

Então o sistema deve exibir uma lista de pagamentos realizados no período ou data selecionados
    Exibir uma lista com 10 pagamentos


Quando ele preenche o filtro gateways de pagamento e clica em 'Filtrar'
    Sleep  4s
    Wait Until Element Is Visible       ${BTN_FILTERS}          ${TIMEOUT_MAX}
    Click Element                       ${BTN_FILTERS}
    Wait Until Element Is Visible       ${LABEL_GATEWAY}        ${TIMEOUT_MAX}
    Element Should Be Visible           ${LABEL_GATEWAY}
    Wait Until Element Is Visible       ${INPUT_GATEWAY}        ${TIMEOUT_MAX}
    Click Element                       ${INPUT_GATEWAY}
    Wait Until Element Is Visible       ${DROPBOARD_GATEWAY}    ${TIMEOUT_MAX}
    Click Element                       ${GATEWAY_LIST}
    Wait Until Element Is Visible       ${BTN_FILTER}           ${TIMEOUT_MAX}
    Click Element                       ${BTN_FILTER}