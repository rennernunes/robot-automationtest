*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PageObjects/Login.robot
Resource            ../resources/PageObjects/GatewayManager.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***

Cenário: Criar um Gateway de pagamentos
    [Documentation]    Teste de criação de gateway de pagamentos
    [Tags]    cria_gateway    dev     qa   
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de gateways
    Quando o usuário cria um gateway
    Então uma mensagem de confirmação é apresentada
    E é possível voltar para a página de listagem de gateways

Cenário: Editar Gateways de pagamentos
    [Documentation]    Teste de listar gateways de pagamentos
    [Tags]    edita_gateway    dev     qa   
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de gateways
    Quando o usuário edita um gateway
    Então uma mensagem de sucesso da edição é apresentada

Cenário: Retorno de gateways
    [Documentation]    Teste de página inicial gateway
    [Tags]    gateway_inicio    dev     qa   
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de gateways
    Então o sistema exibe a página de listagem de gateways

Cenário: Habilitar um Gateway de pagamentos
    [Documentation]    Teste de habilitar gateway de pagamentos
    [Tags]    habilita_gateway    dev     qa   
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de gateways
    Quando o usuário cria um gateway
    E é possível voltar para a página de listagem de gateways
    E o gateway é habilitado
    Então o sistema exibe a página de listagem de gateways

Cenário: Desabilitar um Gateway de pagamentos
    [Documentation]    Teste de desabilitar gateway de pagamentos
    [Tags]    desabilita_gateway    dev     qa   
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de gateways
    Quando o usuário desabilita um gateway
    Então o sistema exibe a página de listagem de gateways

Cenário: Listar Gateways de pagamentos
    [Documentation]    Teste de listar gateways de pagamentos
    [Tags]    lista_gateway    dev     qa   
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de gateways
    Então o sistema exibe a página de listagem de gateways
    E possui ao menos um gateway ativo ou inativo

# Cenário: Desabilitar Gateway vinculado a uma contingência
#     Realizar Login com Sucesso      ${PROFILE} 
#     Dado que o usuário está na página de gerenciamento de gateways
#     Quando o usuário desabilita o gateway
#     Então uma mensagem de confirmação é apresentada
#     E o gateway é movido para os desativados
#     E se o gateway estiver vinculado a uma contingência, a contingência também é desativada

# Cenário: Adicionar gateway a um meio de pagamento
#     [Documentation]    Teste de adicionar gateway a um meio de pagamento
#     [Tags]             adiciona_gateway_payment_method    dev     qa 
#     Realizar Login com Sucesso      ${PROFILE} 
#     Dado que o usuário está na página de gerenciamento de pagamentos
#     Quando o usuário adiciona um gateway a um meio de pagamento
#     Então o sistema exibe a página de adicionar gateway a um meio de pagamento