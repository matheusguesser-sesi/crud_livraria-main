# crud_livraria

RF1: Cadastrar Livro: o sistema deve permitir cadastrar livros informando titulo, autor e ano de publicação;
RF2: Listar Livros: o sistema deve apresentar todos os livros cadastrados;
RF3: Editar Livros: o sistema deve permitir a alteração de informações de livros já cadastrados;
RF4: Excluir Livros: o sistema deve permitir a exclusão de informações de livros já cadastrados;

(1/2) RNF1: Validação dos Campos: O sistema não deve permitir o cadastro de livros com titulo, autor ou ano vazios.
(2/2) RNF2: Segurança dos Dados: As operações que recebem informações fornecidas pelo usuário deverão utilizar Prepared Statements.


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

### Como Prepared Statements mitiga o problema do SQL Injection?

Separando a estrutura do comando dos dados que serão inseridos. A query é montada em duas etapas: 
1. Preparação: (comando é enviado ao banco com placeholders no lugar dos valores);
2. Execução: Valores são enviados separadamente, como dados puros.

Dessa forma, ele elimina a causa raiz do SQL Injection, garantindo que o dado nunca vire um comando. Além disso, com o Prepared Statements, o banco é capaz de reaproveitar o molde de execução já existente, otimizando a execução.


## Análise do Projeto


### Locais onde o sistema realiza operações

index.php: ``` SELECT * FROM livros ```
public/cadastrar.php: ``` INSERT INTO livros ```
public/editar.php: ``` SELECT * FROM livros ```
public/atualizar.php: ``` UPDATE livros SET titulo=... ```
public/excluir.php: ``` DELETE FROM livros WHERE id=$id ```


### Informações recebidas do usuário e utilizadas em comandos

cadastrar.php: ```$_POST["titulo"], $_POST["autor"], $_POST["ano"] ```
atualizar.php: ``` $_POST["id"], $_POST["titulo"], $_POST["autor"], $_POST["ano"] ```
editar.php: ```editar.php: $_GET["id"]```
excluir.php: ```$_GET["id"]```

### O que pode ser modificado?

Vários arquivos podem ser modificados para que fiquem mais seguros utilizando Prepared Statements. Entretanto, o exemplo utilizado será o arquivo de atualizar os cadastros.

*Arquivo a ser editado*

<!-- <?php

include "../infra/conexao.php";

$titulo = $_POST["titulo"];
$autor = $_POST["autor"];
$ano = $_POST["ano"];

$sql = "INSERT INTO livros (titulo,autor,ano) VALUES ('$titulo','$autor','$ano')";

mysqli_query($conexao, $sql);

header("Location: ../index.php");
?> -->

## Alterações Realizadas

<!-- <?php

include "../infra/conexao.php";

$titulo = $_POST["titulo"];
$autor = $_POST["autor"];
$ano = $_POST["ano"];

$sql = "INSERT INTO livros (titulo, autor, ano) VALUES (?, ?, ?)";

$stmt = $conexao->prepare($sql);
$stmt->bind_param("ssi", $titulo, $autor, $ano);
$stmt->execute();
$stmt->close();

header("Location: ../index.php");
?> -->
