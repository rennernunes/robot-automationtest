

*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PageObjects/Login.robot
Resource            ../resources/PageObjects/PaymentMethodManager.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***

Cenário: Retorno de meios de pagamento
    [Documentation]    Teste de página inicial de meio de pagamento
    [Tags]   payment_method_inicio    dev     qa   
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de pagamentos
    Então o sistema exibe a página de listagem de meios de pagamento

Cenário: Criar um Meio de Pagamento
    [Documentation]    Teste de criação meio de pagamento
    [Tags]             cria_payment_method    dev     qa 
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de pagamentos
    Quando usuário cria um meio de pagamento
    Então uma mensagem de sucesso da criação do meio de pagamento é apresentada
    E é possível voltar para a página de listagem de meios de pagamento

Cenário: Habilitar um Meio de Pagamento
    [Documentation]    Teste de habilitar meio de pagamento
    [Tags]             habilita_payment_method    dev     qa 
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de pagamentos
    Quando o usuário habilita um meio de pagamento
    Então o sistema exibe a página de listagem de meios de pagamento

Cenário: Desabilitar um Meio de Pagamento
    [Documentation]    Teste de desabilitar meio de pagamento
    [Tags]             desabilita_payment_method    dev     qa 
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de pagamentos
    Quando o usuário desabilita um meio de pagamento
    Então o sistema exibe uma confirmação de desativação do meio de pagamento
    E o usuário confirma a desativação do meio de pagamento
    Então o sistema exibe a página de listagem de meios de pagamento

Cenário: Listar Meios de Pagamento
    [Documentation]    Teste de listagem de meios de pagamento
    [Tags]             lista_payment_method    dev     qa 
    Realizar Login com Sucesso      ${PROFILE} 
    Dado que o usuário está na página de gerenciamento de pagamentos
    Então o sistema exibe a página de listagem de meios de pagamento
    E possui ao menos um meios de pagamento ativo ou inativo

