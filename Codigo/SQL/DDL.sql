-- limpar as tabelas
DROP TABLE IF EXISTS ZOO.ANIMAL_RELACIONADO;
DROP TABLE IF EXISTS ZOO.ANIMAL;
DROP TABLE IF EXISTS ZOO.RESPONSAVEL_POR;
DROP TABLE IF EXISTS ZOO.HABITACULO;
DROP TABLE IF EXISTS ZOO.HABITAT;
DROP TABLE IF EXISTS ZOO.BILHETE;
DROP TABLE IF EXISTS ZOO.LIMPA;
DROP TABLE IF EXISTS ZOO.FUNCIONARIO_LIMPEZA;
DROP TABLE IF EXISTS ZOO.FUNCIONARIO_BILHETEIRA;
DROP TABLE IF EXISTS ZOO.TRABALHADOR_RESTAURACAO;
DROP TABLE IF EXISTS ZOO.TRATADOR;
DROP TABLE IF EXISTS ZOO.GERENTE;
DROP TABLE IF EXISTS ZOO.SEGURANCA;
DROP TABLE IF EXISTS ZOO.VETERINARIO;
DROP TABLE IF EXISTS ZOO.CONTRATO;
DROP TABLE IF EXISTS ZOO.FUNCIONARIO;
DROP TABLE IF EXISTS ZOO.VISITANTE;
DROP TABLE IF EXISTS ZOO.PESSOA;
DROP TABLE IF EXISTS ZOO.BILHETEIRA;
DROP TABLE IF EXISTS ZOO.RESTAURACAO;
DROP TABLE IF EXISTS ZOO.RECINTO;
DROP TABLE IF EXISTS ZOO.JARDIM_ZOOLOGICO;


-- criacao das tabelas
CREATE TABLE ZOO.JARDIM_ZOOLOGICO (
	Nome						varchar(30)		not null,
	Morada						varchar(50)		not null,
	Estado						varchar(10)		default ('fechado')		CHECK (Estado='aberto' or Estado ='fechado')	not null

	UNIQUE (Morada),
	PRIMARY KEY (Nome)
)

CREATE TABLE ZOO.RECINTO (
	ID							int				not null,
	Nome_JZ						varchar(30)		not null,
	Nome						varchar(30)		not null,
	Estado						varchar(10)		default ('fechado')		CHECK (Estado='aberto' or Estado ='fechado')	not null,
	PRIMARY KEY (ID, Nome_JZ),
	FOREIGN KEY (Nome_JZ) REFERENCES ZOO.JARDIM_ZOOLOGICO(Nome) ON UPDATE CASCADE
)

CREATE TABLE ZOO.RESTAURACAO (
	Recinto_ID					int				not null,
	Nome_JZ						varchar(30)		not null,
	Max_capacidade				int				not null		DEFAULT(50),

	PRIMARY KEY (Recinto_ID, Nome_JZ),
	FOREIGN KEY (Recinto_ID, Nome_JZ) REFERENCES ZOO.RECINTO(ID, Nome_JZ) ON UPDATE CASCADE,
)

CREATE TABLE ZOO.BILHETEIRA (
	Recinto_ID					int				not null,
	Nome_JZ						varchar(30)		not null,
	--derivado nao aparece na tabela Bilhetes_vendidos			int				not null	 CHECK(Bilhetes_vendidos>=0), -- atributo derivado -> views

	PRIMARY KEY (Recinto_ID, Nome_JZ),
	FOREIGN KEY (Recinto_ID, Nome_JZ) REFERENCES ZOO.RECINTO(ID, Nome_JZ) ON UPDATE CASCADE,
)

CREATE TABLE ZOO.PESSOA (
	Numero_CC			int				not null	CHECK (len(Numero_CC)=8),
	Nome				varchar(40)		not null,
	Genero				character		not null	CHECK (Genero='F'or Genero='M'),
	Data_nascimento     date			not null,

	PRIMARY KEY (Numero_CC)
)

CREATE TABLE ZOO.VISITANTE (
	Numero_CC			int				not null	CHECK (len(Numero_CC)=8),
	
	PRIMARY KEY (Numero_CC),
	FOREIGN KEY (Numero_CC) REFERENCES ZOO.PESSOA(Numero_CC) ON UPDATE CASCADE
)

CREATE TABLE ZOO.FUNCIONARIO (
	Numero_CC			int				not null	CHECK (len(Numero_CC)=8),
	Nome_JZ				varchar(30)		not null,
    Num_Funcionario		int				not null,
	Data_ingresso		date			not null,
	
	PRIMARY KEY (Numero_CC),
	FOREIGN KEY (Nome_JZ) REFERENCES ZOO.JARDIM_ZOOLOGICO(Nome) ON UPDATE CASCADE,
	FOREIGN KEY (Numero_CC) REFERENCES ZOO.PESSOA(Numero_CC) ON UPDATE CASCADE
)

CREATE TABLE ZOO.CONTRATO (
	F_Numero_CC			int					not null,
	Tipo_contrato		char(9)				not null	CHECK (Tipo_contrato ='Full-Time' or Tipo_Contrato='Part-Time'),
	Salario				decimal(10,2)		not null,
	Data_inicio_contrato	date			not null,
	Data_fim_contrato		date			not null,

	CHECK(Salario>740), --Inserir salario minimo
	CHECK(Data_fim_contrato>Data_inicio_contrato),
	PRIMARY KEY (F_Numero_CC),
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO(Numero_CC)
);

CREATE TABLE ZOO.VETERINARIO (
	F_Numero_CC			int				not null,
	GerenteVet_Numero	int						,

	PRIMARY KEY (F_Numero_CC),
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO(Numero_CC) ON UPDATE CASCADE,
	FOREIGN KEY (GerenteVet_Numero) REFERENCES ZOO.VETERINARIO(F_Numero_CC)
);

CREATE TABLE ZOO.SEGURANCA (
	F_Numero_CC					int				not null,
	GerenteSeguranca_Numero		int						,
	Recinto_ID					int             DEFAULT(NULL),
	Nome_JZ						varchar(30)		DEFAULT(NULL),

	PRIMARY KEY (F_Numero_CC),
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO(Numero_CC) ON UPDATE CASCADE,
	FOREIGN KEY (Recinto_ID, Nome_JZ) REFERENCES ZOO.RECINTO(ID, Nome_JZ) ON DELETE SET NULL,
	FOREIGN KEY (GerenteSeguranca_Numero) REFERENCES ZOO.SEGURANCA(F_Numero_CC),
);


CREATE TABLE ZOO.GERENTE (
	F_Numero_CC					int				not null,
	Nome_JZ						varchar(30)		not null,

	PRIMARY KEY (F_Numero_CC),
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO(Numero_CC) ON DELETE CASCADE,
	FOREIGN KEY (Nome_JZ) REFERENCES ZOO.JARDIM_ZOOLOGICO(Nome) ON UPDATE CASCADE
);

CREATE TABLE ZOO.TRATADOR (
	F_Numero_CC					int				not null,
	GerenteTratador_Numero		int						,

	PRIMARY KEY (F_Numero_CC),
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO(Numero_CC) ON UPDATE CASCADE,
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.TRATADOR(F_Numero_CC),
)

CREATE TABLE ZOO.TRABALHADOR_RESTAURACAO (
	F_Numero_CC					int				not null,
	Nome_JZ						varchar(30)		DEFAULT(NULL),
	Restauracao_ID				int				DEFAULT(NULL),

	PRIMARY KEY (F_Numero_CC),
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO(Numero_CC),
	FOREIGN KEY (Restauracao_ID, Nome_JZ) REFERENCES ZOO.RESTAURACAO(Recinto_ID, Nome_JZ) ON UPDATE SET NULL
)

CREATE TABLE ZOO.FUNCIONARIO_BILHETEIRA (
	F_Numero_CC					int				not null,
	Nome_JZ						varchar(30)		DEFAULT(NULL),
	--atributo derivado não vai para a tabela Bilhetes_vendidos			int				not null	CHECK (Bilhetes_vendidos>=0), 
	Bilheteira_ID				int				DEFAULT(NULL),

	PRIMARY KEY (F_Numero_CC),
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO(Numero_CC),
	FOREIGN KEY (Bilheteira_ID, Nome_JZ) REFERENCES ZOO.Bilheteira(Recinto_ID, Nome_JZ) ON UPDATE SET NULL
)

CREATE TABLE ZOO.FUNCIONARIO_LIMPEZA (
	F_Numero_CC					int				not null,

	PRIMARY KEY (F_Numero_CC),
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO(Numero_CC) ON UPDATE CASCADE
)


CREATE TABLE ZOO.LIMPA (
	Nome_JZ						varchar(30)		not null,
	Recinto_ID					int				not null,
	FL_Numero_CC				int				not null,

	PRIMARY KEY(Nome_JZ, Recinto_ID, FL_Numero_CC),
	FOREIGN KEY (FL_Numero_CC) REFERENCES ZOO.FUNCIONARIO_LIMPEZA(F_Numero_CC) ON UPDATE CASCADE,
	FOREIGN KEY (Recinto_ID, Nome_JZ) REFERENCES ZOO.RECINTO(ID, Nome_JZ) ON UPDATE NO ACTION,
)

CREATE TABLE ZOO.BILHETE (
	ID							int				not null,
	Preco						decimal(10,2)	not null	CHECK(Preco >= 0)	DEFAULT(10.00),
	Data_Compra					date			not null,
	V_Numero_CC					int				not null,
	F_Numero_CC					int				not null,
	Nome_JZ						varchar(30)		default(null),
	Bilheteira_ID				int				default(null),

	PRIMARY KEY (ID),
	FOREIGN KEY (V_Numero_CC) REFERENCES ZOO.VISITANTE(Numero_CC) ON UPDATE CASCADE,
	FOREIGN KEY (F_Numero_CC) REFERENCES ZOO.FUNCIONARIO_BILHETEIRA(F_Numero_CC) ON UPDATE CASCADE,
	FOREIGN KEY (Bilheteira_ID, Nome_JZ) REFERENCES ZOO.BILHETEIRA(Recinto_ID, Nome_JZ)
)

CREATE TABLE ZOO.HABITAT (
	Recinto_ID					int				not null,
	Nome_JZ						varchar(30)		not null,

	PRIMARY KEY (Recinto_ID, Nome_JZ),
	FOREIGN KEY (Recinto_ID, Nome_JZ) REFERENCES ZOO.RECINTO(ID, Nome_JZ) ON UPDATE CASCADE,
)

CREATE TABLE ZOO.HABITACULO (
	ID							int				not null,
	Habitat_ID					int				not null,
	Nome_JZ						varchar(30)		not null,
	Tamanho						varchar(30)     not null,
	Max_animais					int				not null	CHECK(Max_animais>=1)	DEFAULT 1, 

	PRIMARY KEY (ID, Habitat_ID, Nome_JZ),
	FOREIGN KEY (Habitat_ID, Nome_JZ) REFERENCES ZOO.Habitat(Recinto_ID, Nome_JZ) ON UPDATE CASCADE,
)


CREATE TABLE ZOO.RESPONSAVEL_POR (
	T_Numero_CC					int				not null,
	Nome_JZ						varchar(30)		default(null),
	Habitat_ID					int				default(null),

	PRIMARY KEY (T_Numero_CC, Nome_JZ, Habitat_ID),
	FOREIGN KEY (T_Numero_CC) REFERENCES ZOO.TRATADOR(F_Numero_CC) ON UPDATE CASCADE,
	FOREIGN KEY (Habitat_ID, Nome_JZ) REFERENCES ZOO.Habitat(Recinto_ID, Nome_JZ),
)

CREATE TABLE ZOO.ANIMAL (
	ID							int				not null,
	Dieta						varchar(50)		not null,
	Grupo_Taxonomico			varchar(30)		not null,
	Nome						varchar(30)		not null,
	Cor							varchar(30)		not null,
	Comprimento					decimal(10,2)	not null, --metros
	Peso						decimal(10,2)	not null, --kg
	Especie						varchar(30)		not null,
	Veterinario_CC				int				not null,
	Habitaculo_ID				int				default(null),
	Habitat_ID					int				default(null),
	Nome_JZ						varchar(30)		default(null),

	PRIMARY KEY (ID),
	FOREIGN KEY (Veterinario_CC) REFERENCES ZOO.VETERINARIO(F_Numero_CC) ON UPDATE CASCADE,
	FOREIGN KEY (Habitaculo_ID, Habitat_ID, Nome_JZ) REFERENCES ZOO.HABITACULO(ID, Habitat_ID, Nome_JZ)
)

CREATE TABLE ZOO.ANIMAL_RELACIONADO (
	Animal1_ID			int				not null,
	Animal2_ID			int				not null,
	Relacao				varchar(50)		not null,

	PRIMARY KEY (Animal1_ID, Animal2_ID),
	FOREIGN KEY (Animal1_ID) REFERENCES ZOO.ANIMAL(ID),
	FOREIGN KEY (Animal2_ID) REFERENCES ZOO.ANIMAL(ID) 
)
