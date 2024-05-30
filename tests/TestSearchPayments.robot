*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PageObjects/Login.robot
Resource            ../resources/PageObjects/SearchPayments.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***

Cenário: Retorno de pagamentos
    [Documentation]    Teste de lista paginada
    [Tags]    retorno   dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de consulta de pagamentos
    Então o sistema deve exibir uma lista de 10 pagamentos

Cenário: Exibir mais informações sobre o pagamento
    [Documentation]    Teste nos detalhes de pagamento
    [Tags]    detalhes    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele clica em um pagamento da lista
    Então o sistema deve exibir mais informações sobre o pagamento

Cenário: Performance satisfatória de filtragem
    [Documentation]    Teste de tempo de resposta da lista paginada
    [Tags]    performance    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche as datas desejadas e clica em 'Filtrar'
    Então o sistema deve ter uma performance satisfatória, com tempo de resposta máximo de 2 segundos

Cenário: Filtrar pagamentos por período
    [Documentation]    Teste do filtro de datas
    [Tags]    filtro_periodo    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche as datas desejadas e clica em 'Filtrar'
    Então o sistema deve exibir uma lista de pagamentos realizados no período ou data selecionados

Cenário: Filtrar pagamentos por data
    [Documentation]    Teste do filtro de data
    [Tags]    filtro_data    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche a data desejada e clica em 'Filtrar'
    Então o sistema deve exibir uma lista de pagamentos realizados no período ou data selecionados

Cenário: Filtrar por status de pagamento
    [Documentation]    Teste dos filtros de Status, Forma Pagamento e Gateway
    [Tags]    filtro_status    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche o filtro status de pagamento e clica em 'Filtrar'
    Então o sistema deve exibir pelo menos um pagamento com o filtro "${STATUS}"

Cenário: Filtrar por forma de pagamento
    [Documentation]    Teste dos filtros de Forma Pagamento
    [Tags]    filtro_payment_method    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche o filtro forma de pagamento e clica em 'Filtrar'
    Então o sistema deve exibir pelo menos um pagamento

Cenário: Filtrar por status, forma, gateways de pagamento
    [Documentation]    Teste dos filtros de Gateway de pagamento
    [Tags]    filtros    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche os filtros status, forma, gateways de pagamento e clica em 'Filtrar'
    Então o sistema deve exibir pelo menos um pagamento

Cenário: Cenario buscar por pedido
    [Documentation]    Teste do filtro de pedidos
    [Tags]    filtro_pedidos    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche o filtro com o pedido e clica em 'Filtrar'
    Então o sistema deve exibir pelo menos um pagamento

Cenário: Cenario busca por data e outro filtro
    [Documentation]    Teste do filtro de pedidos
    [Tags]    filtro_geral    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche os filtros numero pedido, data, status e clica em 'Filtrar'
    Então o sistema deve exibir pelo menos um pagamento

# Cenário: Tratar possíveis erros na filtragem
#     Dado que o usuário está na página de consulta de pagamentos
#     Quando ele preenche as datas desejadas e clica em 'Filtrar'
#     Então o sistema deve tratar possíveis erros e exibir uma mensagem informando o usuário

Cenário: Filtrar por gateways de pagamento
    [Documentation]    Teste de filtragem por gateways de pagamento
    [Tags]    filtro_gateway    dev     qa   stg
    Realizar Login com Sucesso      ${PROFILE}
    Dado que o usuário está na página de consulta de pagamentos
    Quando ele preenche o filtro gateways de pagamento e clica em 'Filtrar'
    Então o sistema deve exibir pelo menos um pagamento