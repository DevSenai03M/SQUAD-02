-- Criando Banco de Dados `Livraria`
CREATE DATABASE Livraria;

-- Usando o banco `Livraria`
USE Livraria;

-- Criando tabela `pedido_has_livro`
CREATE TABLE pedido_has_livro(
fk_idPedido int,
fk_idLivro int
);
-- Verificando a tabela `pedido_has_livro`
describe pedido_has_livro;

-- Criando tabela `clientes`
CREATE TABLE clientes(
idCliente int primary key,
nome varchar(255) not null,
telefone varchar(11) not null,
endereço varchar(255) not null,
email varchar(45) not null
);
-- Verificando a tabela `clientes`
describe clientes;

-- Criando tabela `livros`
CREATE TABLE livros(
idLivro int primary key,
titulo varchar(255) not null,
editora varchar(255) not null,
categoria varchar(255) not null,
data_edicao date not null,
autor varchar(255) not null,
fk_idSetor int,
fk_idFornecedor int
);
-- Verificando a tabela `livros`
describe livros;


-- Criando tabela `pedidos`
CREATE TABLE pedidos(
idPedido int primary key,
dataPedido date not null,
valorPedido decimal(9,2),
fk_cliente int
);
-- Verificando a tabela `pedidos`
describe pedidos;

-- Criando tabela `fornecedor`
CREATE TABLE fornecedor(
idFornecedor int primary key,
nome varchar(255) not null,
endereco varchar(255) not null,
telefone varchar(11) not null
);
-- Verificando a tabela `fornecedor`
describe fornecedor;

-- Criando tabela `setor`
CREATE TABLE setor(
idSetor int primary key,
quantidade_livro int not null,
nomeSetor varchar(255),
fk_idLivro int
);
-- Verificando a tabela `setor`
describe setor;

-- Adicionando à tabela `livros` chave estrageira `fk_idSetor` e `fk_idFornecedor` referenciando as tabelas `setor` e `fornecedor`
alter table livros add foreign key (fk_idSetor) references setor(idSetor);
alter table livros add foreign key (fk_idFornecedor) references fornecedor(idFornecedor);

-- Adicionando à tabela `pedidos` chave estrangeira `fk_cliente` referenciando a tabela `clientes`
alter table pedidos add foreign key (fk_cliente) references clientes(idCliente);

-- Adicionando à tabela `pedido_has_livro` chave estrageira `fk_idLivro` e `fk_idPedido` referenciando as tabelas `livros` e `pedidos`
alter table pedido_has_livro add foreign key (fk_idLivro) references livros(idLivro);
alter table pedido_has_livro add foreign key (fk_idPedido) references pedidos(idPedido);