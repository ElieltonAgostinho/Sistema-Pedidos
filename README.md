# README

# Sistema

Para que o sistema funcione, basta fazer o clone do projeto acessar o diretório raíz do projeto(Onde se encontra o arquivo Gemfile) pelo terminal e inicializar o servidor rails

Comando: rails s

O sistema deve ser acessado atravéz do link: 
http://127.0.0.1:3000/login/

Na página de login, o usuário de acesso é:
Login = teste.teste 
Senha = 123456

# Requisições:
ruby versão 2.7.0
rails versão 6.1.3.1
sqlite3

# Base
A estrutura da base já está no sistema, para cria-lá basta executar o comando no diretório raíz do projeto(Onde se encontra o arquivo Gemfile) pelo terminal.

Comando: rake db:migrate



# Pedidos
Esta atividade tem como objetivo, possibilitar que um usuário realize um pedido de produtos.

# Pré-Condição (Deverá ser implementada antes dos Pedidos)
• Produto previamente cadastrado e com situação ativo
• Cliente cadastrado e com situação ativo
# Cenário
1. Usuário acessa o sistema e clica no menu Pedidos
2. O sistema exibe os pedidos realizados
3. O usuário clica no Botão Novo
4. O sistema exibe o formulário de pedido
5. O usuário preenche o formulário e clica em Salvar
6. O sistema grava o pedido e exibe a listagem de pedidos

# Regras de Negócio

# RN01: No formulário de cadastro de Cliente, o formulário deverá possuir os seguintes campos:
• Nome (campo obrigatório)
• Telefone (campo obrigatório)
• Data de Nascimento (campo obrigatório)
# RN02: No formulário de cadastro de Produto, o formulário deverá possuir os seguintes campos:
• Nome (campo obrigatório)
• Valor (campo obrigatório)
# RN03: No cadastro de Pedido:
• Cliente (Irá listar todos os clientes ativos no sistema) (campo obrigatório)
• Produto (irá listar todos os produtos ativos no sistema) (campo obrigatório)
• Valor (Exibir o valor do produto selecionado)
• O pedido poderá possuir um ou mais produtos.
• O sistema deverá gravar a data e hora da realização do pedido
• Deverá ser demonstrado o valor total do pedido.
# RN04: Na listagem de pedidos deverá possuir as seguintes informações:
• Número do Pedido
• Cliente
• Valor Total
• Data
# RN05: Na exibição do pedido deverá ser listados todas as informações do pedido.
# Glossário
*RN: Regra de Negócio