-- Active: 1709940367650@@dbtavinho.mysql.database.azure.com@3306@dbclinica
-- Active: 1709940367650@@dbtavinho.mysql.database.azure.com@3306
drop database dbClinica;
CREATE DATABASE dbClinica;

use dbClinica;

CREATE table tbAmbulatorio(
    nroa int not null AUTO_INCREMENT,
    andar int not null,
    capacidade smallint,
    PRIMARY KEY (nroa)
);

CREATE table tbMedico(
    codm int not null AUTO_INCREMENT,
    nome varchar(40) not null,
    idade smallint not null,
    especialidade char(20),
    CPF varchar(11) UNIQUE,
    cidade varchar(30),
    nroa int,
    foreign key(nroa) references tbambulatorio(nroa),
    PRIMARY KEY(codm)
);

create table tbPaciente(
    codp int AUTO_INCREMENT,
    nome varchar(40) not null,
    idade smallint not null,
    cidade char(30),
    CPF varchar(11) UNIQUE,
    doenca varchar(40) not null,
    PRIMARY KEY (codp)
);

create table tbFuncionario(
    codf int AUTO_INCREMENT,
    nome varchar(40) not null,
    idade smallint,
    CPF varchar(11) UNIQUE,
    cidade varchar(30),
    salario DECIMAL(10,2),
    cargo varchar(20),
    PRIMARY KEY (codf)
);

create table tbConsulta(
    Num_consulta int AUTO_INCREMENT,
    codm int,
    codp int,
    data_Consulta date,
    hora time,
    PRIMARY KEY (Num_consulta),
    foreign key(codm) references tbMedico(codm),
    foreign key(codp) references tbPaciente(codp)
);

show tables;

desc tbAmbulatorio;
desc tbMedico;
desc tbPaciente;
desc tbFuncionario;
desc tbConsulta;


# Ambulatorio
insert into tbAmbulatorio(andar,capacidade)VALUES(1,30);
insert into tbAmbulatorio(andar,capacidade)VALUES(1,50);
insert into tbAmbulatorio(andar,capacidade)VALUES(2,40);
insert into tbAmbulatorio(andar,capacidade)VALUES(2,25);
insert into tbAmbulatorio(andar,capacidade)VALUES(2,55);

# Médico
insert into tbMedico(nome, idade, especialidade, CPF, cidade)values("João", 40, "ortopedia", 10000100000, "Florianopolis");
insert into tbMedico(nome, idade, especialidade, CPF, cidade)values("Maria", 42, "traumatologia", 10000110000, "Blumenau");
insert into tbMedico(nome, idade, especialidade, CPF, cidade)values("Pedro", 51, "pediatria", 11000100000, "São José");
insert into tbMedico(nome, idade, especialidade, CPF, cidade)values("Carlos", 28, "ortopedia", 11000110000, "Joinville");
insert into tbMedico(nome, idade, especialidade, CPF, cidade)values("Marcia", 33, "neurologia", 11000111000, "Biguacu");

# Paciente
insert into tbPaciente(nome, idade, cidade, CPF, doenca)values("Ana", 20, "Florianopolis", 20000200000, "gripe");
insert into tbPaciente(nome, idade, cidade, CPF, doenca)values("Paulo", 24, "Palhoca", 20000220000, "fratura");
insert into tbPaciente(nome, idade, cidade, CPF, doenca)values("Lucia", 30, "Biguacu", 22000200000, "tendinite");
insert into tbPaciente(nome, idade, cidade, CPF, doenca)values("Carlos", 28, "Biguacu", 11000110000, "sarampo");

# Funcionario
insert into tbFuncionario(nome, idade, cidade, salario, CPF)values("Rita", 32, "Sao Jose", 1200, 20000100000);
insert into tbFuncionario(nome, idade, cidade, salario, CPF)values("Maria", 55, "Palhoca", 1220, 30000110000);
insert into tbFuncionario(nome, idade, cidade, salario, CPF)values("Caio", 45, "Florianopolis", 1100, 41000100000);
insert into tbFuncionario(nome, idade, cidade, salario, CPF)values("Carlos", 44, "Florianopolis", 1200, 51000110000);
insert into tbFuncionario(nome, idade, cidade, salario, CPF)values("Paula", 32, "Florianopolis", 2500, 61000111000);

# Consulta
insert into tbConsulta(codm, codp, data_Consulta, hora)values(1, 1,"2006/06/12", "14:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(1, 4,"2006/06/13", "10:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(2, 1,"2006/06/13", "9:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(2, 2,"2006/06/13", "11:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(2, 3,"2006/06/14", "14:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(2, 4,"2006/06/14", "17:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(3, 1,"2006/06/19", "18:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(3, 3,"2006/06/12", "10:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(3, 4,"2006/06/19", "13:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(4, 4,"2006/06/20", "13:00");
insert into tbConsulta(codm, codp, data_Consulta, hora)values(4, 4,"2006/06/22", "19:30");

-- Vizualizador
select * from tbAmbulatorio;
select * from tbMedico;
select * from tbPaciente;
select * from tbFuncionario;
select * from tbConsulta;

# Cria uma Coluna na Tabela desejada
ALTER TABLE tbFuncionario ADD COLUMN nroa int;
# Transforma uma Coluna em Chave Estrangeira
ALTER TABLE tbFuncionario ADD Foreign Key (nroa) REFERENCES tbAmbulatorio(nroa);

# Apaga um coluna 
alter table tbFuncionario drop column cargo;

# Realizar as seguintes atualizações no BD
# 1) O paciente Paulo mudou-se para Ilhota
update tbPaciente set cidade = 'Ilhota' where nome = "Paulo";
# 2) A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Julho de 2006
update tbConsulta set hora = '12:00', data_Consulta = "2006/07/04" WHERE codm = 1 and codp = 4;
# 3) A paciente Ana fez aniversário e sua doença agora é hepatite
update tbPaciente set idade = idade + 1, doenca = "hepatite" WHERE nome = "Ana";
# 4) A consulta do médico Pedro (codm = 3) com o paciente Carlos (codp = 4) passou para uma hora e meia depois
update tbConsulta set hora = DATE_ADD(hora, INTERVAL "01:30" HOUR_MINUTE) WHERE codm = 3 and codp = 4;
# 5) O funcionário Carlos (codf = 4) deixou a clínica
delete from tbFuncionario where codf = 4;
# 6) As consultas marcadas após as 19 horas foram canceladas
delete from tbConsulta where hora > "19:00";
# 7) Os pacientes com câncer ou idade inferior a 10 anos deixaram a clínica
delete from tbPaciente WHERE doenca = "cancer" or idade < 10;
# 8) Os médicos que residem em Biguacu e Palhoca deixaram a clínica
delete from tbMedico WHERE cidade = "Biguacu" or cidade = "Palhoca"; 

-- Vizualizador
select * from tbAmbulatorio;
select * from tbMedico;
select * from tbPaciente;
select * from tbFuncionario;
select * from tbConsulta;