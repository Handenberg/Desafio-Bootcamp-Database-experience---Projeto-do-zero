create database if not exists CertificadoDigital;
use certificadoDigital;

create table Cliente(
IdCliente int auto_increment not null,
Pname varchar (50),
Lname varchar(50),
Endereco varchar (255),
ContatoTelefone varchar(12),
Email varchar (255),
CPF enum('CPF','CNPJ') not null, 
primary key (IdCliente)
);

create table Certificado_digital(
IdCertificado enum('A1','A3') not null,
IdProtocolo int primary key not null,
Validade enum ('1 ano', '2 anos', '3 anos'),
Tipo enum ('Cartão', 'Token', 'Sem_midia'),
Valor decimal not null,
constraint fk_certificado_Cliente foreign key (IdProtocolo) references Cliente(IdCliente)
);

create table AgenteEmissor(
IdAgente int auto_increment not null primary key,
Pname varchar(50) not null,
CPF char(11),
Lname varchar(20),
localidade varchar(30),
Contato varchar(15),
Email varchar(255)
constraint fk_AgenteEmissor foreign key (IdAgente) References Certificado_digital(IdProtocolo)
);

create table Pagamento(
IdPagamento int auto_increment primary key,
FormaDePagamento enum('Dinheiro', 'Cartão', 'Boleto', 'Pix')
);

create table Contador(
IdContador varchar(50) primary key,
Pname varchar(50),
ContatoTelefone char(11),
ComissãoIndicação decimal
);

