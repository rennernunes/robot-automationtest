<div style="text-align: center;">
  <a href="" rel="noopener">
    <img style="width: 200px; height: 200px; border-radius: 50%;" src="utils/.png" alt="Logotipo do projeto">
  </a>
</div>


<h1 align="center">Cockpit Automation Front</h1>

<div style="text-align: center;">

[![Status](https://img.shields.io/badge/status-active-success.svg)](https://gitlab.com/)
<br>
</div>

---

<p align="center"> 

    O Robot Framework é um framework de código aberto usado para testes de aceitação (ATDD) e automação de processos robóticos (RPA). Desenvolvido principalmente para Python, usa uma linguagem tabular e keywords para escrever casos de teste. Sua flexibilidade sintática permite escrever cenários de teste de forma mais próxima à linguagem humana, e também suporta a sintaxe Gherkin.
    
</p>

## 📝 Índice

- [Sobre](#🧐-sobre)
- [Construído usando](#⛏️-construído-usando)
- [Primeiros passos](#🏁-primeiros-passos)
- [Executando os testes](#🔧-executando-os-testes)
- [Flow](#🤖-flow)
- [Autores](#✍️-autores)
- [Links do Robot Framework](#📌-links-do-robot-framework)

## 🧐 Sobre

Estas instruções a preparar o ambiente para rodar seus testes com o Robot Framework em sua máquina MacOS local para fins de desenvolvimento e teste. 

 `Caso utilize outro SO, siga as intruções desse` [link](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst)

Estrutura do projeto

```
cockpit-automation-front
├─ .gitignore
├─ .gitlab-ci.yml
├─ Dockerfile
├─ README.md
├─ requirements.txt
├─ resources
│  ├─ PageObjects
│  │  ├─ Login.robot
│  │  ├─ Logout.robot
│  │  └─ SearchPayments.robot
│  └─ Resource.robot
├─ results
│  ├─ log.html
│  ├─ output.xml
│  └─ report.html
├─ tests
│  ├─ TestLoginCockpit.robot
│  └─ TestSearchPayments.robot
└─ utils
   ├─ boosters_v2.jpg
   └─ raiadrogasil.png

```

## ⛏️ Construído usando

- [Robot Framework](https://robotframework.org/) - Framework de casos de teste
- [Test Case Generator Flow](https://flow.ciandt.com/test-case-generator) - Gerador de cenários de testes
- [Test Code Generator Flow](https://flow.ciandt.com/test-code-generator) - Gerador de código de testes
- [Copilot](https://github.com/features/copilot) - Assistente de IA generativa

## 🏁 Primeiros passos no MacOS

 `Caso utilize outro SO, siga as intruções desse` [link](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst)

Não esqueça de verificar a versão do Python e do PIP depois de instalar:

```
pip3 --version
```

A minha versão atual é a [3.12](), caso não esteja, siga para o tópico [Pré-requisitos](#pré-requisitos)

Mas pra que o Python 3??? Bom, para instalar o Robot e o SeleniumLibrary, nós precisaremos utilizar o comando Pip, que vem junto com o Python 3 na hora da instalação.


### Pré-requisitos

` Primeiro você vai precisar instalar o  `[Python 3](https://www.python.org/downloads/mac-osx/)` clicando nesse` [link](https://www.python.org/downloads/mac-osx/).



## Configuração do Ambiente

#### Ajuste do PATH para Python 3.12 no Zsh

Se você instalou o Python 3.12, configure no Zsh, siga as instruções abaixo:

```
nano ~/.zshrc
```

Adicione essas linhas ao final do seu arquivo ~/.zshrc:

```
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH"
```

Após adicionar essas linhas, salve o arquivo e recarregue o seu perfil do Zsh com o comando:

```
source ~/.zshrc
```

## Configuração do Projeto

Executar no terminal:

```
 pip3 install -r requirements.txt
```

Verifique a versão do robot:

```
 robot --version
```

## 🔧 Executando os testes <a name = "tests"></a>

### 

#### Comando para executar testes no Robot

Trocar os perfis: PROFILE:DEV, PROFILE:QA, PROFILE:STG, PROFILE:PROD

Por DEFAULT os testes rodarão com Perfil de DEV, até que seja passado um novo profile por comando:

```
robot -d logs tests/* #Executa todos os testes

ou

robot -d logs tests/arquivo.robot #Executa um teste especifico

ou

robot -d logs -v PROFILE:QA tests/arquivo.robot #Executa em outro ambiente

ou

robot -d logs -i <nome_tag> tests/arquivo.robot #Executa um cenário de teste especifico
```

Modo headless, sem abrir o navegador:

```
robot -d logs -v MODE_BROWSER:headless -i <nome_tag> tests/arquivo.robot

ou

robot -d logs -v PROFILE:DEV -v MODE_BROWSER:headless -i <nome_tag> tests/arquivo.robot
```



* `robot` -> para executar os testes do robot.

* `-d` -> diretório de logs outDir. Cada vez que um teste é executado, ele gera um novo arquivo de log.

* `./logs` -> diretório para armazenar todos os arquivos de logs.

* `-v` -> variável que será substituida

* `MODE` -> variável a ser definida na linha de comando para rodar em headless. Deve ser **headless** ou não deve ser passada
  
* `-i` -> Seletor de tags. Filtra todos os testes pelas suas tags.

* `nome_tag` -> Nome das tags que estão anexadas aos testes. Para filtrar com mais de uma tag, use "AND" entre os nomes das tags.

* `tests/` -> diretório da pasta onde está localizado o arquivo de testes.

* `file.robot` -> arquivo de teste a ser executado.
<br  />
<br  />


## 🤖 Copilot <a name = "deployment"></a>



Você pode acelerar o desenvolvimento com Copilot, segue os vídeos com exemplo de uso 

<div style="text-align: center;">
  <a href="" rel="noopener">
    <img style="width: 700px; height: 400px; " src="utils/boosters_v2.jpg" alt="Logotipo do projeto">
  </a>
</div>

[# Generator Video Exemplo de Uso](https://)


[# Copilot Video Exemplo de Uso]()


## ✍️ Autores <a name = "autores"></a>
### [@renner](https:) -Trabalho inicial

## 📌 Links do Robot Framework

*  [Robot Framework](https://robotframework.org/)

*  [Robot Framework documentation](https://robotframework.org/robotframework/)

*  [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

*  [Robot Framework SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)

* [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
> A biblioteca BuiltIn contém palavras-chave genéricas frequentemente necessárias. Importadas automaticamente e, portanto, sempre disponíveis.
