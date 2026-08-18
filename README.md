# crud_livraria

RF1: Cadastrar Livro: o sistema deve permitir cadastrar livros informando titulo, autor e ano de publicação;
RF2: Listar Livros: o sistema deve apresentar todos os livros cadastrados;
RF3: Editar Livros: o sistema deve permitir a alteração de informações de livros já cadastrados;
RF4: Excluir Livros: o sistema deve permitir a exclusão de informações de livros já cadastrados;

(1/2) RNF1: Validação dos Campos: O sistema não deve permitir o cadastro de livros com titulo, autor ou ano vazios.


# Pesquisa - Melhorando a Segurança do CRUD com Prepared Statements

## **Prepared Statements**

### O que é?

 Prepared Statements são um meio de executar comandos SQL onde a estrutura da consulta é separada dos dados que serão utilizados nela. Antes de montar a query com os valores recebidos, se define um molde da consulta com espaços reservados (placeholders), representados por "?". Após isso, os dados reais são inseridos de forma separada para preencher os espaços. Quando o banco de dados recebe essa consulta, ele entende a diferença entre o comando e os dados.
 Mesmo que o valor enviado tenha caracteres especiais ou partes que pareçam fazer parte de uma query, ele é interpretado como valor e não como comando.

### Por que não é recomendado inserir diretamente informações fornecidas pelo usuário dentro de comandos SQL?

 Inserir dados diretamente na consulta cria possibilidades de ocorrer SQL Injection, uma perigosa vulnerabilidade de aplicações que usam banco de daados. Na query, sem o Prepared Statements, o banco de dados não consegue diferenciar dado e código.

## SQL Injection

### O que é?

 O SQL Injection é uma técnica de ataque onde alguém insere comandos SQL através dos campos de entrada da aplicação (formulários, campos de busca etc). Dessa forma, o banco de dados execua algo diferente do que o dev deseja.
 Enquanto a aplicação deseja receber um dado, a pessoa mal intencionada envia um código SQL disfarçado de dado. Dessa maneira, pode ocorrer de o banco executar isso como parte do comando.

### Como Prepared Statements ajudam a proteger a aplicação?

Separando a estrutura do comando dos dados que serão inseridos. A query é montada em duas etapas: 
1. Preparação: (comando é enviado ao banco com placeholders no lugar dos valores);
2. Execução: Valores são enviados separadamente, como dados puros.

Dessa forma, ele elimina a causa raiz do SQL Injection, garantindo que o dado nunca vire um comando. Além disso, com o Prepared Statements, o banco é capaz de reaproveitar o molde de execução já existente, otimizando a execução.


## Análise do Projeto


### Locais onde o sistema realiza operações



### Informações recebidas do usuário e utilizadas em comandos


### O que pode ser modificado?




## Alterações Realizadas