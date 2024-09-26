INSERT INTO ZOO.JARDIM_ZOOLOGICO (Nome, Morada, Estado) VALUES 
('ZOOLife Norte', 'R. Estação, 4470-184 Maia', 'aberto'),
('ZOOLife Centro', 'Rua Professor Fernando da Fonseca, 1501-806 Lisboa','aberto');

INSERT INTO ZOO.RECINTO (ID, Nome_JZ, Nome, Estado) VALUES
(1, 'ZOOLife Norte', 'Entrada Este', 'aberto'),
(2, 'ZOOLife Norte', 'Entrada Oeste', 'aberto'),
(3, 'ZOOLife Norte', 'Bilheteira Este', 'aberto'),
(4, 'ZOOLife Norte', 'Bilheteira Oeste', 'aberto'),
(5, 'ZOOLife Norte', 'Bar ZooBar', 'aberto'),
(6, 'ZOOLife Norte', 'Restaurante Manel do Zoo', 'aberto'),
(7, 'ZOOLife Norte', 'Habitat Polar', 'aberto'),
(8, 'ZOOLife Norte', 'Habitat Selva', 'aberto'),
(9, 'ZOOLife Norte', 'Habitat Aquatico', 'aberto'),
(10, 'ZOOLife Norte', 'Habitat Savana', 'aberto'),
(11, 'ZOOLife Norte', 'Habitat Aves', 'aberto'),
(12, 'ZOOLife Norte', 'Loja de Lembranças', 'aberto'),
(13, 'ZOOLife Centro', 'Entrada Este', 'aberto'),
(14, 'ZOOLife Centro', 'Entrada Oeste', 'aberto'),
(15, 'ZOOLife Centro', 'Bilheteira Este', 'aberto'),
(16, 'ZOOLife Centro', 'Bilheteira Oeste', 'aberto'),
(17, 'ZOOLife Centro', 'Bar Zoo Snack', 'aberto'),
(18, 'ZOOLife Centro', 'Restaurante Iguarias do Zoo', 'aberto'),
(19, 'ZOOLife Centro', 'Habitat Polar', 'aberto'),
(20, 'ZOOLife Centro', 'Habitat Selva', 'aberto'),
(21, 'ZOOLife Centro', 'Habitat Aquatico', 'aberto'),
(22, 'ZOOLife Centro', 'Habitat Savana', 'aberto'),
(23, 'ZOOLife Centro', 'Habitat Aves', 'aberto'),
(24, 'ZOOLife Centro', 'Loja de Lembranças', 'aberto');

INSERT INTO ZOO.RESTAURACAO (Recinto_ID, Nome_JZ, Max_capacidade) VALUES
(5, 'ZOOLife Norte', 50),
(6, 'ZOOLife Norte', 80),
(17, 'ZOOLife Centro', 65),
(18, 'ZOOLife Centro', 100);

INSERT INTO ZOO.Habitat (Recinto_ID, Nome_JZ) VALUES
(7, 'ZOOLife Norte'),
(8, 'ZOOLife Norte'),
(9, 'ZOOLife Norte'),
(10, 'ZOOLife Norte'),
(11, 'ZOOLife Norte'),
(19, 'ZOOLife Centro'),
(20, 'ZOOLife Centro'),
(21, 'ZOOLife Centro'),
(22, 'ZOOLife Centro'),
(23, 'ZOOLife Centro');


INSERT INTO ZOO.BILHETEIRA (Recinto_ID, Nome_JZ) VALUES
(3, 'ZOOLife Norte'),
(4, 'ZOOLife Norte'), 
(15, 'ZOOLife Centro'),
(16, 'ZOOLife Centro');


INSERT INTO ZOO.PESSOA (Numero_CC, Nome, Genero, Data_Nascimento)
VALUES
(12345678, 'João Silva', 'M', '1980-01-01'),
(23456789, 'Maria Oliveira', 'F', '1985-01-01'),
(34567890, 'Pedro Sousa', 'M', '1990-01-01'),
(45678901, 'Ana Costa', 'F', '1995-01-01'),
(56789012, 'Manuel Pereira', 'M', '2000-01-01'),
(67890123, 'Sofia Martins', 'F', '2005-01-01'),
(78901234, 'Ricardo Gomes', 'M', '2000-01-01'),
(89012345, 'Inês Rodrigues', 'F', '2001-01-01'),
(90123456, 'Bruno Santos', 'M', '2002-01-01'),
(10234567, 'Carolina Lopes', 'F', '2002-01-01'),

(11345678, 'Diogo Ferreira', 'M', '1983-02-02'),
(12456789, 'Beatriz Silva', 'F', '1987-03-03'),
(13567890, 'André Costa', 'M', '1991-04-04'),
(14678901, 'Catarina Pereira', 'F', '1996-05-05'),
(15789012, 'David Martins', 'M', '2001-06-06'),
(16890123, 'Filipa Gomes', 'F', '2003-07-07'),
(17901234, 'Eduardo Rodrigues', 'M', '1998-08-08'),
(18012345, 'Gabriela Santos', 'F', '2000-09-09'),
(19123456, 'João Lopes', 'M', '1993-10-10'),
(20234567, 'Mariana Ferreira', 'F', '1980-11-11'),

(21345678, 'António Silva', 'M', '1975-02-02'),
(22456789, 'Luísa Oliveira', 'F', '1980-03-03'),
(23567890, 'Miguel Sousa', 'M', '1985-04-04'),
(24678901, 'Isabel Costa', 'F', '1990-05-05'),
(25789012, 'José Pereira', 'M', '1995-06-06'),
(26890123, 'Catarina Martins', 'F', '2000-07-07'),
(27901234, 'Marco Gomes', 'M', '2005-08-08'),
(28012345, 'Sofia Rodrigues', 'F', '2000-09-09'),
(29123456, 'Tiago Santos', 'M', '2000-10-10'),
(30234567, 'Ana Lopes', 'F', '2000-11-11'),

(31345678, 'Francisco Costa', 'M', '1965-11-11'),
(32456789, 'Ana Pereira', 'F', '1970-10-10'),
(33567890, 'Manuel Martins', 'M', '1975-09-09'),
(34678901, 'Sofia Gomes', 'F', '1980-08-08'),
(35789012, 'Ricardo Rodrigues', 'M', '1985-07-07'),
(36890123, 'Inês Santos', 'F', '1990-06-06'),
(37901234, 'Bruno Lopes', 'M', '1995-05-05'),
(38012345, 'Carolina Ferreira', 'F', '2000-04-04'),
(39123456, 'Diogo Silva', 'M', '2005-03-03'),
(40234567, 'Beatriz Oliveira', 'F', '1999-02-02'),

(41345678, 'André Costa', 'M', '1997-01-01'),
(42456789, 'Catarina Pereira', 'F', '1962-12-25'),
(43567890, 'David Martins', 'M', '1967-11-11'),
(44678901, 'Filipa Gomes', 'F', '1972-10-10'),
(45789012, 'Eduardo Rodrigues', 'M', '1977-09-09'),
(46890123, 'Gabriela Santos', 'F', '1982-08-08'),
(47901234, 'João Lopes', 'M', '1987-07-07'),
(48012345, 'Mariana Ferreira', 'F', '1992-06-06'),
(49123456, 'António Silva', 'M', '1997-05-05'),
(50234567, 'Luísa Oliveira', 'F', '1964-04-04'),

(19234567, 'Miguel Ferreira', 'M', '2001-01-01'),
(19345678, 'Teresa Soares', 'F', '2002-02-02'),
(19456789, 'Rodrigo Costa', 'M', '2003-03-03'),
(19567890, 'Ana Sousa', 'F', '2004-04-04'),
(19678901, 'Rui Pereira', 'M', '2001-05-05'),
(19789012, 'Martina Martins', 'F', '2002-06-06'),
(19890123, 'Marco Gomes', 'M', '2003-07-07'),
(19901234, 'Catia Rodrigues', 'F', '2004-08-08'),
(20012345, 'Pedro Santos', 'M', '2005-09-09'),
(20123456, 'Joana Lopes', 'F', '2004-10-10'),

(51345678, 'Miguel Ferreira', 'M', '1980-01-01'),
(52456789, 'Teresa Silva', 'F', '1985-01-01'),
(53567890, 'Hugo Costa', 'M', '1990-01-01'),
(54678901, 'Rita Sousa', 'F', '1995-01-01'),
(55789012, 'Gonçalo Pereira', 'M', '2000-01-01'),
(56890123, 'Marta Martins', 'F', '2005-01-01'),
(57901234, 'Luis Gomes', 'M', '2010-01-01'),
(58012345, 'Carla Rodrigues', 'F', '2015-01-01'),
(59123456, 'André Santos', 'M', '2020-01-01'),
(60234567, 'Mariana Lopes', 'F', '2021-01-01'),

(61345678, 'Rui Oliveira', 'M', '1983-02-02'),
(62456789, 'Sara Costa', 'F', '1987-03-03'),
(63567890, 'Paulo Rodrigues', 'M', '1991-04-04'),
(64678901, 'Inês Pereira', 'F', '1996-05-05'),
(65789012, 'Pedro Martins', 'M', '2001-06-06'),
(66890123, 'Ana Gomes', 'F', '2006-07-07'),
(67901234, 'Tiago Santos', 'M', '2011-08-08'),
(68012345, 'Andreia Ferreira', 'F', '2016-09-09'),
(69123456, 'Joana Lopes', 'M', '2022-10-10'),
(70234567, 'Nuno Ferreira', 'F', '2023-11-11'),

-- a partir daqui sao visitantes apenas
(71345678, 'Mário Silva', 'M', '1975-02-02'),
(72456789, 'Carolina Oliveira', 'F', '1980-03-03'),
(73567890, 'Jorge Sousa', 'M', '1985-04-04'),
(74678901, 'Vera Costa', 'F', '1990-05-05'),
(75789012, 'Fábio Pereira', 'M', '1995-06-06'),
(76890123, 'Diana Martins', 'F', '2000-07-07'),
(77901234, 'Miguel Gomes', 'M', '2005-08-08'),
(78012345, 'Inês Rodrigues', 'F', '2010-09-09'),
(79123456, 'Sérgio Santos', 'M', '2015-10-10'),
(80234567, 'Rita Lopes', 'F', '2020-11-11'),

(81345678, 'José Costa', 'M', '1965-11-11'),
(82456789, 'Ana Pereira', 'F', '1970-10-10'),
(83567890, 'Luís Martins', 'M', '1975-09-09'),
(84678901, 'Mónica Gomes', 'F', '1980-08-08'),
(85789012, 'Carlos Rodrigues', 'M', '1985-07-07'),
(86890123, 'Tânia Santos', 'F', '1990-06-06'),
(87901234, 'Ricardo Lopes', 'M', '1995-05-05'),
(88012345, 'Mafalda Ferreira', 'F', '2000-04-04'),
(89123456, 'Bruno Silva', 'M', '2005-03-03'),
(90234567, 'Patrícia Oliveira', 'F', '2010-02-02'),

(91234567, 'Alexandre Correia', 'M', '1984-05-10'),
(92245678, 'Marta Figueiredo', 'F', '1993-06-15'),
(93356789, 'Vitor Carvalho', 'M', '1981-07-20'),
(94467890, 'Paula Cardoso', 'F', '1986-08-25'),
(95578901, 'João Neves', 'M', '1990-09-30'),
(96689012, 'Raquel Mendes', 'F', '1994-10-05'),
(97790123, 'Hugo Vieira', 'M', '1995-11-10'),
(98801234, 'Susana Azevedo', 'F', '1989-12-15'),
(99912345, 'Fernando Pires', 'M', '1982-01-20'),
(91023456, 'Tatiana Dias', 'F', '1985-02-25'),

(91134567, 'Carlos Matos', 'M', '1987-03-30'),
(91245678, 'Rita Almeida', 'F', '1988-04-04'),
(91356789, 'Ricardo Mota', 'M', '1991-05-05'),
(91467890, 'Ana Brito', 'F', '1992-06-06'),
(91578901, 'João Antunes', 'M', '1993-07-07'),
(91689012, 'Isabel Fonseca', 'F', '1994-08-08'),
(91790123, 'Miguel Barros', 'M', '1995-09-09'),
(91801234, 'Helena Ferreira', 'F', '1996-10-10'),
(91912345, 'Pedro Campos', 'M', '1997-11-11'),
(92023456, 'Ana Ribeiro', 'F', '1998-12-12'),

(92134567, 'Luis Mendes', 'M', '1999-01-13'),
(99245678, 'Mariana Cardoso', 'F', '2000-02-14'),
(92356789, 'João Moreira', 'M', '2001-03-15'),
(92467890, 'Clara Batista', 'F', '2002-04-16'),
(92578901, 'Tiago Ferreira', 'M', '2003-05-17'),
(92689012, 'Laura Costa', 'F', '2004-06-18'),
(92790123, 'Rui Silva', 'M', '2005-07-19'),
(92801234, 'Sara Teixeira', 'F', '2006-08-20'),
(92912345, 'Diogo Simões', 'M', '2007-09-21'),
(93023456, 'Vanessa Marques', 'F', '2008-10-22'),

(93134567, 'José Coelho', 'M', '2009-11-23'),
(93245678, 'Luísa Monteiro', 'F', '2010-12-24'),
(99356789, 'Paulo Gonçalves', 'M', '2011-01-25'),
(93467890, 'Vera Nunes', 'F', '2012-02-26'),
(93578901, 'Hélder Sousa', 'M', '2013-03-27'),
(93689012, 'Marisa Pinto', 'F', '2014-04-28'),
(93790123, 'Alberto Ferreira', 'M', '2015-05-29'),
(93801234, 'Daniela Mendes', 'F', '2016-06-30'),
(93912345, 'Carlos Nascimento', 'M', '2017-07-31'),
(94023456, 'Sofia Santos', 'F', '2018-08-01'),

(94134567, 'João Figueiredo', 'M', '2019-09-02'),
(94245678, 'Cristina Matos', 'F', '2020-10-03'),
(94356789, 'Manuel Costa', 'M', '2021-11-04'),
(99467890, 'Inês Ferreira', 'F', '2022-12-05'),
(94578901, 'André Almeida', 'M', '2023-01-06'),
(94689012, 'Patrícia Pires', 'F', '1980-02-07'),
(94790123, 'Nuno Campos', 'M', '1985-03-08'),
(94801234, 'Filipa Oliveira', 'F', '1990-04-09'),
(94912345, 'Mário Correia', 'M', '1995-05-10'),
(95023456, 'Helena Rocha', 'F', '2000-06-11');


INSERT INTO ZOO.VISITANTE(Numero_CC) VALUES
(71345678),
(72456789),
(73567890),
(74678901),
(75789012),
(76890123),
(77901234),
(78012345),
(79123456),
(80234567),

(81345678),
(82456789),
(83567890),
(84678901),
(85789012),
(86890123),
(87901234),
(88012345),
(89123456),
(90234567),

(91234567),
(92245678),
(93356789),
(94467890),
(95578901),
(96689012),
(97790123),
(98801234),
(99912345),
(91023456),

(91134567),
(91245678),
(91356789),
(91467890),
(91578901),
(91689012),
(91790123),
(91801234),
(91912345),
(92023456),

(92134567),
(99245678),
(92356789),
(92467890),
(92578901),
(92689012),
(92790123),
(92801234),
(92912345),
(93023456),

(93134567),
(93245678),
(99356789),
(93467890),
(93578901),
(93689012),
(93790123),
(93801234),
(93912345),
(94023456),

(94134567),
(94245678),
(94356789),
(99467890),
(94578901),
(94689012),
(94790123),
(94801234),
(94912345),
(95023456);

INSERT INTO ZOO.FUNCIONARIO (Numero_CC, Nome_JZ, Num_Funcionario, Data_Ingresso) VALUES
(12345678, 'ZOOLife Norte', 1, '1998-01-01'),
(23456789, 'ZOOLife Norte', 2, '2003-01-01'),
(34567890, 'ZOOLife Norte', 3, '2008-01-01'),
(45678901, 'ZOOLife Norte', 4, '2013-01-01'),
(56789012, 'ZOOLife Norte', 5, '2018-01-01'),
(67890123, 'ZOOLife Norte', 6, '2023-01-01'),
(78901234, 'ZOOLife Norte', 7, '2018-01-01'),
(89012345, 'ZOOLife Norte', 8, '2019-01-01'),
(90123456, 'ZOOLife Norte', 9, '2020-01-01'),
(10234567, 'ZOOLife Norte', 10, '2020-01-01'),

(11345678, 'ZOOLife Norte', 11, '2001-02-02'),
(12456789, 'ZOOLife Norte', 12, '2005-03-03'),
(13567890, 'ZOOLife Norte', 13, '2009-04-04'),
(14678901, 'ZOOLife Norte', 14, '2014-05-05'),
(15789012, 'ZOOLife Norte', 15, '2019-06-06'),
(16890123, 'ZOOLife Norte', 16, '2021-07-07'),
(17901234, 'ZOOLife Norte', 17, '2006-08-08'),
(18012345, 'ZOOLife Norte', 18, '2018-09-09'),
(19123456, 'ZOOLife Norte', 19, '2011-10-10'),
(20234567, 'ZOOLife Norte', 20, '1998-11-11'),

(21345678, 'ZOOLife Norte', 21, '1993-02-02'),
(22456789, 'ZOOLife Norte', 22, '1998-03-03'),
(23567890, 'ZOOLife Norte', 23, '2003-04-04'),
(24678901, 'ZOOLife Norte', 24, '2008-05-05'),
(25789012, 'ZOOLife Norte', 25, '2013-06-06'),
(26890123, 'ZOOLife Norte' , 26, '2018-07-07'),
(27901234, 'ZOOLife Norte' , 27, '2023-08-08'),
(28012345, 'ZOOLife Norte' , 28, '2018-09-09'),
(29123456, 'ZOOLife Norte' , 29, '2018-10-10'),
(30234567, 'ZOOLife Norte' , 30, '2018-11-11'),

(31345678, 'ZOOLife Norte' , 31, '1983-11-11'),
(32456789, 'ZOOLife Norte' , 32, '1988-10-10'),
(33567890, 'ZOOLife Norte' , 33, '1993-09-09'),
(34678901, 'ZOOLife Norte' , 34, '1998-08-08'),
(35789012, 'ZOOLife Norte' , 35, '2003-07-07'),
(36890123, 'ZOOLife Norte' , 36, '2008-06-06'),
(37901234, 'ZOOLife Norte' , 37, '2013-05-05'),
(38012345, 'ZOOLife Norte' , 38, '2018-04-04'),
(39123456, 'ZOOLife Norte' , 39, '2023-03-03'),
(40234567, 'ZOOLife Norte' , 40, '2017-02-02'),

(41345678, 'ZOOLife Centro' , 41, '2015-01-01'),
(42456789, 'ZOOLife Centro' , 42, '1980-12-25'),
(43567890, 'ZOOLife Centro' , 43, '1985-11-11'),
(44678901, 'ZOOLife Centro' , 44, '1990-10-10'),
(45789012, 'ZOOLife Centro' , 45, '1995-09-09'),
(46890123, 'ZOOLife Centro' , 46, '2000-08-08'),
(47901234, 'ZOOLife Centro' , 47, '2005-07-07'),
(48012345, 'ZOOLife Centro' , 48, '2010-06-06'),
(49123456, 'ZOOLife Centro' , 49, '2015-05-05'),
(50234567, 'ZOOLife Centro' , 50, '1982-04-04'),

(19234567, 'ZOOLife Centro' , 51, '2022-01-01'),
(19345678, 'ZOOLife Centro' , 52, '2023-12-25'),
(19456789, 'ZOOLife Centro' , 53, '2023-11-11'),
(19567890, 'ZOOLife Centro' , 54, '2022-10-10'),
(19678901, 'ZOOLife Centro' , 55, '2023-09-09'),
(19789012, 'ZOOLife Centro' , 56, '2022-08-08'),
(19890123, 'ZOOLife Centro' , 57, '2023-07-07'),
(19901234, 'ZOOLife Centro' , 58, '2023-06-06'),
(20012345, 'ZOOLife Centro' , 59, '2023-05-05'),
(20123456, 'ZOOLife Centro' , 60, '2023-04-04'),

(51345678, 'ZOOLife Centro', 61, '1980-01-01'),
(52456789, 'ZOOLife Centro', 62, '1985-01-01'),
(53567890, 'ZOOLife Centro', 63, '1990-01-01'),
(54678901, 'ZOOLife Centro', 64, '1995-01-01'),
(55789012, 'ZOOLife Centro', 65, '2000-01-01'),
(56890123, 'ZOOLife Centro', 66, '2005-01-01'),
(57901234, 'ZOOLife Centro', 67, '2010-01-01'),
(58012345, 'ZOOLife Centro', 68, '2015-01-01'),
(59123456, 'ZOOLife Centro', 69, '2020-01-01'),
(60234567, 'ZOOLife Centro', 70, '2021-01-01'),

(61345678, 'ZOOLife Centro', 71, '1983-02-02'),
(62456789, 'ZOOLife Centro', 72, '1987-03-03'),
(63567890, 'ZOOLife Centro', 73, '1991-04-04'),
(64678901, 'ZOOLife Centro', 74, '1996-05-05'),
(65789012, 'ZOOLife Centro', 75, '2001-06-06'),
(66890123, 'ZOOLife Centro', 76, '2006-07-07'),
(67901234, 'ZOOLife Centro', 77, '2011-08-08'),
(68012345, 'ZOOLife Centro', 78, '2016-09-09'),
(69123456, 'ZOOLife Centro', 79, '2022-10-10'),
(70234567, 'ZOOLife Centro', 80, '2023-11-11');


INSERT INTO ZOO.CONTRATO (F_Numero_CC, Tipo_Contrato, Salario, Data_inicio_contrato, Data_fim_contrato) VALUES
(12345678, 'Full-Time', 3000.00, '1998-01-01', '2028-01-01'), --GERENTE
(23456789, 'Full-Time', 1250.00, '2003-01-01', '2027-01-01'), --TRATADOR
(34567890, 'Full-Time', 1300.00, '2008-01-01', '2028-01-01'),
(45678901, 'Full-Time', 1350.00, '2013-01-01', '2027-01-01'),
(56789012, 'Full-Time', 1400.00, '2018-01-01', '2028-01-01'),
(67890123, 'Full-Time', 1500.00, '2023-01-01', '2026-01-01'),
(78901234, 'Full-Time', 1450.00, '2018-01-01', '2028-01-01'),
(89012345, 'Part-Time', 900.00, '2019-01-01', '2029-01-01'),
(90123456, 'Part-Time', 850.00, '2020-01-01', '2025-01-01'),
(10234567, 'Part-Time', 950.00, '2020-01-01', '2025-01-01'),

(11345678, 'Full-Time', 1100.00, '2001-02-02', '2021-02-02'),
(12456789, 'Full-Time', 1150.00, '2005-03-03', '2025-03-03'),
(13567890, 'Full-Time', 1200.00, '2009-04-04', '2029-04-04'),
(14678901, 'Full-Time', 1250.00, '2014-05-05', '2025-05-05'), --VETERINARIO
(15789012, 'Part-Time', 850.00, '2019-06-06', '2029-06-06'),
(16890123, 'Part-Time', 900.00, '2021-07-07', '2024-07-07'),
(17901234, 'Full-Time', 1300.00, '2006-08-08', '2026-08-08'),
(18012345, 'Part-Time', 950.00, '2018-09-09', '2028-09-09'),
(19123456, 'Full-Time', 1350.00, '2011-10-10', '2026-10-10'),
(20234567, 'Full-Time', 1400.00, '1998-11-11', '2028-11-11'), --SEGURANCA

(21345678, 'Full-Time', 1250.00, '1993-02-02', '2028-02-02'),
(22456789, 'Full-Time', 1300.00, '1998-03-03', '2028-03-03'),
(23567890, 'Full-Time', 1350.00, '2003-04-04', '2027-04-04'),
(24678901, 'Full-Time', 1400.00, '2008-05-05', '2028-05-05'), 
(25789012, 'Full-Time', 1450.00, '2013-06-06', '2024-06-06'), -- FUNC BILHETEIRA
(26890123, 'Full-Time', 1500.00, '2018-07-07', '2028-07-07'),
(27901234, 'Part-Time', 1000.00, '2023-08-08', '2025-08-08'),
(28012345, 'Full-Time', 1550.00, '2018-09-09', '2028-09-09'),
(29123456, 'Full-Time', 1600.00, '2018-10-10', '2028-10-10'), -- FUNC LIMPEZA
(30234567, 'Part-Time', 1050.00, '2018-11-11', '2028-11-11'),

(31345678, 'Full-Time', 1150.00, '1983-11-11', '2025-11-11'),
(32456789, 'Full-Time', 1200.00, '1988-10-10', '2028-10-10'),
(33567890, 'Full-Time', 1250.00, '1993-09-09', '2026-09-09'),
(34678901, 'Full-Time', 1300.00, '1998-08-08', '2028-08-08'), -- RESTAURACAO
(35789012, 'Full-Time', 1350.00, '2003-07-07', '2024-07-07'), 
(36890123, 'Full-Time', 1400.00, '2008-06-06', '2028-06-06'),
(37901234, 'Full-Time', 1450.00, '2013-05-05', '2026-05-05'),
(38012345, 'Part-Time', 1000.00, '2018-04-04', '2028-04-04'),
(39123456, 'Part-Time', 950.00, '2023-03-03', '2027-03-03'),
(40234567, 'Full-Time', 1500.00, '2017-02-02', '2027-02-02'),
--AQUI COMEÇA OS FUNCIONARIOS DO ZOO Centro
(41345678, 'Full-Time', 3000.00, '2015-01-01', '2025-01-01'), --GERENTE
(42456789, 'Full-Time', 1100.00, '1980-12-25', '2029-12-25'), --TRATADOR
(43567890, 'Full-Time', 1150.00, '1985-11-11', '2025-11-11'),
(44678901, 'Full-Time', 1200.00, '1990-10-10', '2029-10-10'),
(45789012, 'Full-Time', 1250.00, '1995-09-09', '2025-09-09'),
(46890123, 'Full-Time', 1300.00, '2000-08-08', '2029-08-08'),
(47901234, 'Full-Time', 1350.00, '2005-07-07', '2025-07-07'),
(48012345, 'Full-Time', 1400.00, '2010-06-06', '2027-06-06'),
(49123456, 'Full-Time', 1300.00, '2015-05-05', '2025-05-05'),
(50234567, 'Full-Time', 1300.00, '1982-04-04', '2025-04-04'),

(19234567, 'Part-Time' , 850, '2022-01-01', '2024-08-01'),
(19345678, 'Part-Time' , 800, '2023-12-25', '2024-12-25'),
(19456789, 'Part-Time' , 800, '2023-11-11', '2024-11-11'),
(19567890, 'Part-Time' , 850, '2022-10-10', '2024-10-10'), --VETERINARIO
(19678901, 'Part-Time' , 800, '2023-09-09', '2024-09-09'),
(19789012, 'Part-Time' , 850, '2022-08-08', '2024-08-08'),
(19890123, 'Part-Time' , 800, '2023-07-07', '2024-07-07'),
(19901234, 'Part-Time' , 800, '2023-06-06', '2024-06-06'),
(20012345, 'Part-Time' , 800, '2023-05-05', '2024-06-05'),
(20123456, 'Part-Time' , 800, '2023-04-04', '2024-07-04'), --SEGURANCA

(51345678, 'Full-Time', 1500,'1980-01-01', '2025-07-01'),
(52456789, 'Full-Time', 1300,'1985-01-01', '2025-04-01'),
(53567890, 'Full-Time', 1300,'1990-01-01', '2026-08-01'),
(54678901, 'Full-Time', 1200,'1995-01-01', '2025-09-01'),
(55789012, 'Full-Time', 1200,'2000-01-01', '2024-08-01'), --FUNC BILHETEIRA
(56890123, 'Full-Time', 1200,'2005-01-01', '2024-07-01'),
(57901234, 'Full-Time', 1200,'2010-01-01', '2026-08-01'),
(58012345, 'Full-Time', 1200,'2015-01-01', '2027-09-01'),
(59123456, 'Full-Time', 1100,'2020-01-01', '2028-08-01'), -- FUNC LIMPEZA
(60234567, 'Full-Time', 1100,'2021-01-01', '2025-09-01'),

(61345678, 'Full-Time', 1500,'1983-02-02', '2026-02-02'),
(62456789, 'Full-Time', 1600,'1987-03-03', '2027-03-03'),
(63567890, 'Full-Time', 1200,'1991-04-04', '2028-04-04'),
(64678901, 'Full-Time', 1200,'1996-05-05', '2029-05-05'), --RESTAURACAO
(65789012, 'Full-Time', 1200,'2001-06-06', '2027-06-06'),
(66890123, 'Full-Time', 1200,'2006-07-07', '2026-07-07'),
(67901234, 'Full-Time', 1200,'2011-08-08', '2025-08-08'),
(68012345, 'Full-Time', 1200,'2016-09-09', '2026-09-09'),
(69123456, 'Part-Time', 850,'2022-10-10', '2024-10-10'),
(70234567, 'Part-Time', 800,'2023-11-11', '2024-11-11');


INSERT INTO ZOO.GERENTE (F_Numero_CC, Nome_JZ) VALUES
(12345678, 'ZOOLife Norte'),
(41345678, 'ZOOLife Centro');

INSERT INTO ZOO.TRATADOR (F_Numero_CC,GerenteTratador_Numero) VALUES
(23456789, NULL),
(34567890, 23456789),
(45678901, 23456789),
(56789012, 23456789),
(67890123, 23456789),
(78901234, 23456789),
(89012345, 23456789),
(90123456, 23456789),
(10234567, 23456789),
(11345678, 23456789),
(12456789, 23456789),
(13567890, 23456789),

(42456789, NULL),
(43567890, 42456789),
(44678901, 42456789),
(45789012, 42456789),
(46890123, 42456789),
(47901234, 42456789),
(48012345, 42456789),
(49123456, 42456789),
(50234567, 42456789),
(19234567, 42456789),
(19345678, 42456789),
(19456789, 42456789);

INSERT INTO ZOO.VETERINARIO (F_Numero_CC, GerenteVet_Numero) VALUES

(14678901, NULL),
(15789012, 14678901),
(16890123, 14678901),
(17901234, 14678901),
(18012345, 14678901),
(19123456, 14678901),

(19567890, NULL),
(19678901, 19567890),
(19789012, 19567890),
(19890123, 19567890),
(19901234, 19567890),
(20012345, 19567890);

INSERT INTO ZOO.SEGURANCA (F_Numero_CC, GerenteSeguranca_Numero, Recinto_ID, Nome_JZ) VALUES
(20234567, NULL, 1, 'ZOOLife Norte'),
(21345678, 20234567, 2, 'ZOOLife Norte'),
(22456789, 20234567, 3, 'ZOOLife Norte'),
(23567890, 20234567, 4, 'ZOOLife Norte'),
(24678901, 20234567, NULL, 'ZOOLife Norte'),

(20123456, NULL, 13, 'ZOOLife Centro'),
(51345678, 20123456, 14, 'ZOOLife Centro'),
(52456789, 20123456, 15, 'ZOOLife Centro'),
(53567890, 20123456, 16, 'ZOOLife Centro'),
(54678901, 20123456, NULL, 'ZOOLife Centro');

INSERT INTO ZOO.FUNCIONARIO_BILHETEIRA (F_Numero_CC, Nome_JZ, Bilheteira_ID) VALUES 
(25789012, 'ZOOLife Norte', 3),
(26890123, 'ZOOLife Norte', 3),
(27901234, 'ZOOLife Norte', 4),
(28012345, 'ZOOLife Norte', 4),

(55789012, 'ZOOLife Centro', 15),
(56890123, 'ZOOLife Centro', 15),
(57901234, 'ZOOLife Centro', 16),
(58012345, 'ZOOLife Centro', 16);


INSERT INTO ZOO.TRABALHADOR_RESTAURACAO (F_Numero_CC, Nome_JZ, Restauracao_ID) VALUES
(34678901, 'ZOOLife Norte', 5),
(35789012, 'ZOOLife Norte', 5),
(36890123, 'ZOOLife Norte', 6),
(37901234, 'ZOOLife Norte', 6),
(38012345, 'ZOOLife Norte', 6),
(39123456, 'ZOOLife Norte', 6),
(40234567, 'ZOOLife Norte', 6),

(64678901, 'ZOOLife Centro', 17),
(65789012, 'ZOOLife Centro', 17),
(66890123, 'ZOOLife Centro', 18),
(67901234, 'ZOOLife Centro', 18),
(68012345, 'ZOOLife Centro', 18),
(69123456, 'ZOOLife Centro', 18),
(70234567, 'ZOOLife Centro', 18);


INSERT INTO ZOO.FUNCIONARIO_LIMPEZA (F_Numero_CC) VALUES 
(29123456),
(30234567),
(31345678),
(32456789),
(33567890),

(59123456),
(60234567),
(61345678),
(62456789),
(63567890);

INSERT INTO ZOO.LIMPA (Nome_JZ, Recinto_ID, FL_Numero_CC) VALUES 

('ZOOLife Norte', 1, 29123456),
('ZOOLife Norte', 1, 30234567),
('ZOOLife Norte', 1, 31345678),

('ZOOLife Norte', 2, 30234567),
('ZOOLife Norte', 2, 31345678),
('ZOOLife Norte', 2, 32456789),

('ZOOLife Norte', 3, 31345678),
('ZOOLife Norte', 3, 32456789),
('ZOOLife Norte', 3, 33567890),

('ZOOLife Norte', 4, 32456789),
('ZOOLife Norte', 4, 33567890),

('ZOOLife Norte', 5, 33567890),

('ZOOLife Norte', 6, 29123456),

('ZOOLife Norte', 7, 29123456),
('ZOOLife Norte', 7, 30234567),

('ZOOLife Norte', 8, 29123456),
('ZOOLife Norte', 8, 32456789),
('ZOOLife Norte', 8, 33567890),

('ZOOLife Norte', 9, 29123456),
('ZOOLife Norte', 9, 30234567),

('ZOOLife Norte', 10, 30234567),
('ZOOLife Norte', 10, 31345678),
('ZOOLife Norte', 10, 32456789),

('ZOOLife Norte', 11, 31345678),
('ZOOLife Norte', 11, 32456789),
('ZOOLife Norte', 11, 33567890),

('ZOOLife Norte', 12, 32456789),
('ZOOLife Norte', 12, 33567890),

('ZOOLife Centro', 13, 59123456),
('ZOOLife Centro', 13, 60234567),
('ZOOLife Centro', 13, 61345678),

('ZOOLife Centro', 14, 60234567),
('ZOOLife Centro', 14, 61345678),
('ZOOLife Centro', 14, 62456789),

('ZOOLife Centro', 15, 61345678),
('ZOOLife Centro', 15, 62456789),
('ZOOLife Centro', 15, 63567890),

('ZOOLife Centro', 16, 62456789),
('ZOOLife Centro', 16, 63567890),

('ZOOLife Centro', 17, 63567890),

('ZOOLife Centro', 18, 59123456),

('ZOOLife Centro', 19, 59123456),
('ZOOLife Centro', 19, 60234567),

('ZOOLife Centro', 20, 59123456),
('ZOOLife Centro', 20, 62456789),
('ZOOLife Centro', 20, 63567890),

('ZOOLife Centro', 21, 59123456),
('ZOOLife Centro', 21, 60234567),

('ZOOLife Centro', 22, 60234567),
('ZOOLife Centro', 22, 61345678),
('ZOOLife Centro', 22, 62456789),

('ZOOLife Centro', 23, 61345678),
('ZOOLife Centro', 23, 62456789),
('ZOOLife Centro', 23, 63567890),

('ZOOLife Centro', 24, 62456789),
('ZOOLife Centro', 24, 63567890);



INSERT INTO ZOO.Bilhete(ID, Preco, Data_Compra, V_Numero_CC, F_Numero_CC, Nome_JZ, Bilheteira_ID) 
VALUES
(1, 10.00, '2023-06-19',  71345678, 25789012,'ZOOLife Norte', 3),
(2, 10.00, '2023-08-17',  72456789, 25789012,'ZOOLife Norte', 3),
(3, 10.00, '2023-09-23',  73567890, 25789012,'ZOOLife Norte', 3),
(4, 10.00, '2023-03-18',  74678901, 27901234,'ZOOLife Norte', 4),
(5, 10.00, '2023-01-18',  75789012, 25789012,'ZOOLife Norte', 3),
(6, 10.00, '2023-05-12',  76890123, 27901234,'ZOOLife Norte', 4),
(7, 10.00, '2023-04-02',  77901234, 25789012,'ZOOLife Norte', 3),
(8, 10.00, '2023-02-28',  78012345, 27901234,'ZOOLife Norte', 4),
(9, 10.00, '2023-12-09',  79123456, 27901234,'ZOOLife Norte', 4),
(10, 10.00, '2023-11-01', 80234567, 25789012,'ZOOLife Norte', 3),

(11, 10.00, '2023-06-22', 81345678, 55789012,'ZOOLife Centro', 15),
(12, 10.00, '2023-08-23', 82456789, 57901234,'ZOOLife Centro', 16),
(13, 10.00, '2023-09-26', 83567890, 57901234,'ZOOLife Centro', 16),
(14, 10.00, '2023-03-10', 84678901, 57901234,'ZOOLife Centro', 16),
(15, 10.00, '2023-01-08', 85789012, 55789012,'ZOOLife Centro', 15),
(16, 10.00, '2023-05-07', 86890123, 57901234,'ZOOLife Centro', 16),
(17, 10.00, '2023-04-06', 87901234, 57901234,'ZOOLife Centro', 16),
(18, 10.00, '2023-02-04', 88012345, 55789012,'ZOOLife Centro', 15),
(19, 10.00, '2023-12-04', 89123456, 57901234,'ZOOLife Centro', 16),
(20, 10.00, '2023-10-04', 90234567, 57901234,'ZOOLife Centro', 16),

(21, 10.00, '2023-06-28', 91234567, 25789012,'ZOOLife Norte', 3),
(22, 10.00, '2023-08-28', 92245678, 27901234,'ZOOLife Norte', 4),
(23, 10.00, '2023-09-28', 93356789, 27901234,'ZOOLife Norte', 4),
(24, 10.00, '2023-03-28', 94467890, 27901234,'ZOOLife Norte', 4),
(25, 10.00, '2023-01-28', 95578901, 27901234,'ZOOLife Norte', 4),
(26, 10.00, '2023-05-26', 96689012, 25789012,'ZOOLife Norte', 3),
(27, 10.00, '2023-04-20', 97790123, 27901234,'ZOOLife Norte', 4),
(28, 10.00, '2023-02-18', 98801234, 25789012,'ZOOLife Norte', 3),
(29, 10.00, '2023-12-19', 99912345, 25789012,'ZOOLife Norte', 3),
(30, 10.00, '2023-10-17', 91023456, 25789012,'ZOOLife Norte', 3),

(31, 10.00, '2023-06-20', 91134567, 57901234,'ZOOLife Centro', 16),
(32, 10.00, '2023-08-19', 91245678, 55789012,'ZOOLife Centro', 15),
(33, 10.00, '2023-09-04', 91356789, 55789012,'ZOOLife Centro', 15),
(34, 10.00, '2023-03-01', 91467890, 55789012,'ZOOLife Centro', 15),
(35, 10.00, '2023-01-03', 91578901, 57901234,'ZOOLife Centro', 16),
(36, 10.00, '2023-05-09', 91689012, 55789012,'ZOOLife Centro', 15),
(37, 10.00, '2023-04-11', 91790123, 57901234,'ZOOLife Centro', 16),
(38, 10.00, '2023-02-19', 91801234, 55789012,'ZOOLife Centro', 15),
(39, 10.00, '2023-12-21', 91912345, 55789012,'ZOOLife Centro', 15),
(40, 10.00, '2023-10-26', 92023456, 55789012,'ZOOLife Centro', 15),

(41, 10.00, '2023-06-21', 92134567, 26890123,'ZOOLife Norte', 3),
(42, 10.00, '2023-08-22', 99245678, 28012345,'ZOOLife Norte', 4),
(43, 10.00, '2023-09-27', 92356789, 28012345,'ZOOLife Norte', 4),
(44, 10.00, '2023-03-11', 92467890, 28012345,'ZOOLife Norte', 4),
(45, 10.00, '2023-01-09', 92578901, 28012345,'ZOOLife Norte', 4),
(46, 10.00, '2023-05-08', 92689012, 26890123,'ZOOLife Norte', 3),
(47, 10.00, '2023-04-07', 92790123, 28012345,'ZOOLife Norte', 4),
(48, 10.00, '2023-02-05', 92801234, 26890123,'ZOOLife Norte', 3),
(49, 10.00, '2023-12-05', 92912345, 26890123,'ZOOLife Norte', 3),
(50, 10.00, '2023-10-05', 93023456, 26890123,'ZOOLife Norte', 3),

(51, 10.00, '2023-06-23', 93134567, 56890123,'ZOOLife Centro', 15),
(52, 10.00, '2023-08-24', 93245678, 58012345,'ZOOLife Centro', 16),
(53, 10.00, '2023-09-29', 99356789, 58012345,'ZOOLife Centro', 16),
(54, 10.00, '2023-03-12', 93467890, 58012345,'ZOOLife Centro', 16),
(55, 10.00, '2023-01-10', 93578901, 56890123,'ZOOLife Centro', 15),
(56, 10.00, '2023-05-11', 93689012, 58012345,'ZOOLife Centro', 16),
(57, 10.00, '2023-04-10', 93790123, 58012345,'ZOOLife Centro', 16),
(58, 10.00, '2023-02-08', 93801234, 56890123,'ZOOLife Centro', 15),
(59, 10.00, '2023-12-08', 93912345, 58012345,'ZOOLife Centro', 16),
(60, 10.00, '2023-10-08', 94023456, 58012345,'ZOOLife Centro', 16),

(61, 10.00, '2023-06-24', 94134567, 26890123,'ZOOLife Norte', 3),
(62, 10.00, '2023-08-25', 94245678, 28012345,'ZOOLife Norte', 4),
(63, 10.00, '2023-09-30', 94356789, 28012345,'ZOOLife Norte', 4),
(64, 10.00, '2023-03-13', 99467890, 28012345,'ZOOLife Norte', 4),
(65, 10.00, '2023-01-11', 94578901, 28012345,'ZOOLife Norte', 4),
(66, 10.00, '2023-05-10', 94689012, 26890123,'ZOOLife Norte', 3),
(67, 10.00, '2023-04-09', 94790123, 28012345,'ZOOLife Norte', 4),
(68, 10.00, '2023-02-07', 94801234, 26890123,'ZOOLife Norte', 3),
(69, 10.00, '2023-12-07', 94912345, 26890123,'ZOOLife Norte', 3),
(70, 10.00, '2023-10-07', 95023456, 26890123,'ZOOLife Norte', 3),

(71, 10.00, '2023-06-24', 71345678, 25789012,'ZOOLife Norte', 3),
(72, 10.00, '2023-08-25', 72456789, 25789012,'ZOOLife Norte', 3),
(73, 10.00, '2023-09-30', 73567890, 25789012,'ZOOLife Norte', 3),
(74, 10.00, '2023-03-13', 74678901, 27901234,'ZOOLife Norte', 4),
(75, 10.00, '2023-01-11', 75789012, 25789012,'ZOOLife Norte', 3),
(76, 10.00, '2023-05-10', 76890123, 27901234,'ZOOLife Norte', 4),
(77, 10.00, '2023-04-09', 77901234, 25789012,'ZOOLife Norte', 3),
(78, 10.00, '2023-02-07', 78012345, 27901234,'ZOOLife Norte', 4),
(79, 10.00, '2023-12-07', 79123456, 27901234,'ZOOLife Norte', 4),
(80, 10.00, '2023-10-07', 80234567, 25789012,'ZOOLife Norte', 3),

(81, 10.00, '2023-06-23', 94134567, 56890123,'ZOOLife Centro', 15),
(82, 10.00, '2023-08-24', 94245678, 58012345,'ZOOLife Centro', 16),
(83, 10.00, '2023-09-29', 94356789, 58012345,'ZOOLife Centro', 16),
(84, 10.00, '2023-03-12', 99467890, 58012345,'ZOOLife Centro', 16),
(85, 10.00, '2023-01-10', 94578901, 56890123,'ZOOLife Centro', 15),
(86, 10.00, '2023-05-11', 94689012, 58012345,'ZOOLife Centro', 16),
(87, 10.00, '2023-04-10', 94790123, 58012345,'ZOOLife Centro', 16),
(88, 10.00, '2023-02-08', 94801234, 56890123,'ZOOLife Centro', 15),
(89, 10.00, '2023-12-08', 94912345, 58012345,'ZOOLife Centro', 16),
(90, 10.00, '2023-10-08', 95023456, 58012345,'ZOOLife Centro', 16),

(91, 10.00, '2023-06-28', 81345678, 25789012,'ZOOLife Norte', 3),
(92, 10.00, '2023-08-28', 82456789, 27901234,'ZOOLife Norte', 4),
(93, 10.00, '2023-09-28', 83567890, 27901234,'ZOOLife Norte', 4),
(94, 10.00, '2023-03-28', 84678901, 27901234,'ZOOLife Norte', 4),
(95, 10.00, '2023-01-28', 85789012, 27901234,'ZOOLife Norte', 4),
(96, 10.00, '2023-05-26', 86890123, 25789012,'ZOOLife Norte', 3),
(97, 10.00, '2023-04-20', 87901234, 27901234,'ZOOLife Norte', 4),
(98, 10.00, '2023-02-18', 88012345, 25789012,'ZOOLife Norte', 3),
(99, 10.00, '2023-12-19', 89123456, 25789012,'ZOOLife Norte', 3),
(100, 10.00, '2023-10-17', 90234567, 25789012,'ZOOLife Norte', 3);

INSERT INTO ZOO.HABITACULO (ID, Habitat_ID, Nome_JZ, Tamanho, Max_animais) VALUES
(1, 7, 'ZOOLife Norte', '100m2', 20),
(2, 8, 'ZOOLife Norte', '120m2', 20),
(3, 9, 'ZOOLife Norte', '150m2', 20),
(4, 10, 'ZOOLife Norte', '200m2', 29),
(5, 11, 'ZOOLife Norte', '80m2', 28),
(6, 7, 'ZOOLife Norte', '100m2', 22),
(7, 7, 'ZOOLife Norte', '110m2', 26),
(8, 8, 'ZOOLife Norte', '130m2', 21),
(9, 8, 'ZOOLife Norte', '140m2', 23),
(10, 9, 'ZOOLife Norte', '160m2', 22),
(11, 9, 'ZOOLife Norte', '170m2', 20),
(12, 10, 'ZOOLife Norte', '180m2', 20),
(13, 10, 'ZOOLife Norte', '190m2', 20),
(14, 11, 'ZOOLife Norte', '90m2', 20),
(15, 11, 'ZOOLife Norte', '100m2', 20),

(16, 19, 'ZOOLife Centro', '100m2', 22),
(17, 20, 'ZOOLife Centro', '120m2', 22),
(18, 21, 'ZOOLife Centro', '150m2', 25),
(19, 22, 'ZOOLife Centro', '200m2', 26),
(20, 23, 'ZOOLife Centro', '80m2', 23),
(21, 19, 'ZOOLife Centro', '100m2', 24),
(22, 19, 'ZOOLife Centro', '110m2', 22),
(23, 20, 'ZOOLife Centro', '130m2', 20),
(24, 20, 'ZOOLife Centro', '140m2', 20),
(25, 21, 'ZOOLife Centro', '160m2', 20),
(26, 21, 'ZOOLife Centro', '170m2', 25),
(27, 22, 'ZOOLife Centro', '180m2', 26),
(28, 22, 'ZOOLife Centro', '190m2', 17),
(29, 23, 'ZOOLife Centro', '90m2', 22),
(30, 23, 'ZOOLife Centro', '100m2', 22);


INSERT INTO ZOO.ANIMAL (ID, Dieta, Grupo_Taxonomico, Nome, Cor, Comprimento, Peso, Especie, Veterinario_CC, Habitaculo_ID, Habitat_ID, Nome_JZ) VALUES

(1, 'Herbívoro', 'Mamífero', 'Elefante', 'Cinza', 3.00, 6000.00, 'Loxodonta africana', 14678901, 12, 10, 'ZOOLife Norte'),
(2, 'Carnívoro', 'Ave', 'Águia', 'Castanho', 1.20, 5.00, 'Aquila chrysaetos', 15789012, 15, 11, 'ZOOLife Norte'),
(3, 'Omnívoro', 'Mamífero', 'Urso', 'Castanho', 2.10, 300.00, 'Ursus arctos', 16890123, 13, 10, 'ZOOLife Norte'),
(4, 'Carnívoro', 'Mamífero', 'Leão', 'Amarelo', 2.50, 250.00, 'Panthera leo', 17901234, 13, 10, 'ZOOLife Norte'),
(5, 'Herbívoro', 'Ave', 'Papagaio', 'Verde', 0.40, 1.00, 'Amazona aestiva', 18012345, 14, 11, 'ZOOLife Norte'),
(6, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19123456, 8, 8, 'ZOOLife Norte'),

(7, 'Carnívoro', 'Mamífero', 'Tigre', 'Laranja', 3.10, 220.00, 'Panthera tigris', 14678901, 9, 8, 'ZOOLife Norte'),
(193, 'Carnívoro', 'Mamífero', 'Tigre', 'Laranja', 3.10, 220.00, 'Panthera tigris', 14678901, 9, 8, 'ZOOLife Norte'),

(8, 'Herbívoro', 'Réptil', 'Tartaruga', 'Verde', 1.00, 150.00, 'Chelonia mydas', 15789012, 2, 8, 'ZOOLife Norte'),
(191, 'Herbívoro', 'Réptil', 'Tartaruga', 'Verde', 1.00, 150.00, 'Chelonia mydas', 15789012, 2, 8, 'ZOOLife Norte'),
(192, 'Herbívoro', 'Réptil', 'Tartaruga', 'Verde', 1.00, 150.00, 'Chelonia mydas', 15789012, 2, 8, 'ZOOLife Norte'),

(10, 'Herbívoro', 'Mamífero', 'Girafa', 'Amarelo e Marrom', 5.00, 1200.00, 'Giraffa camelopardalis', 17901234, 12, 10, 'ZOOLife Norte'),
(11, 'Carnívoro', 'Ave', 'Coruja', 'Branca', 0.50, 1.20, 'Bubo scandiacus', 18012345, 14, 11, 'ZOOLife Norte'),

(13, 'Carnívoro', 'Mamífero', 'Lobo', 'Cinza', 1.80, 50.00, 'Canis lupus', 14678901, 12, 10, 'ZOOLife Norte'),

(16, 'Herbívoro', 'Ave', 'Flamingo', 'Rosa', 1.20, 2.50, 'Phoenicopterus roseus', 17901234, 14, 11, 'ZOOLife Norte'),
(17, 'Herbívoro', 'Mamífero', 'Antílope', 'Castanho', 1.40, 60.00, 'Antilope cervicapra', 18012345, 12, 10, 'ZOOLife Norte'),
(18, 'Omnívoro', 'Mamífero', 'Porco', 'Rosa', 1.10, 100.00, 'Sus scrofa domesticus', 19123456, 4, 10, 'ZOOLife Norte'),
(19, 'Herbívoro', 'Mamífero', 'Búfalo', 'Preto', 1.80, 800.00, 'Syncerus caffer', 14678901, 12, 10, 'ZOOLife Norte'),

(21, 'Omnívoro', 'Ave', 'Pato', 'Branco', 0.50, 1.50, 'Anas platyrhynchos', 16890123, 14, 11, 'ZOOLife Norte'),

(24, 'Omnívoro', 'Mamífero', 'Urso Panda', 'Preto e Branco', 1.80, 100.00, 'Ailuropoda melanoleuca', 19123456, 6, 7, 'ZOOLife Norte'),

(26, 'Carnívoro', 'Mamífero', 'Hiena', 'Castanho', 1.50, 60.00, 'Crocuta crocuta', 14678901, 13, 10, 'ZOOLife Norte'),

(30, 'Carnívoro', 'Mamífero', 'Pantera', 'Preta', 2.20, 100.00, 'Panthera pardus', 14678901, 13, 10, 'ZOOLife Norte'),
(31, 'Herbívoro', 'Ave', 'Cisne', 'Branco', 1.20, 10.00, 'Cygnus olor', 15789012, 14, 11, 'ZOOLife Norte'),
(32, 'Omnívoro', 'Mamífero', 'Gorila', 'Preto', 1.80, 200.00, 'Gorilla beringei', 16890123, 8, 8, 'ZOOLife Norte'),

(36, 'Carnívoro', 'Ave', 'Falcão', 'Cinza', 0.60, 1.50, 'Falco peregrinus', 15789012, 15, 11, 'ZOOLife Norte'),
(37, 'Herbívoro', 'Réptil', 'Iguana', 'Verde', 1.50, 5.00, 'Iguana iguana', 14678901, 2, 8, 'ZOOLife Norte'),

(39, 'Carnívoro', 'Mamífero', 'Raposa', 'Vermelho', 1.00, 10.00, 'Vulpes vulpes', 17901234, 4, 10, 'ZOOLife Norte'),
(41, 'Omnívoro', 'Mamífero', 'Chimpanzé', 'Preto', 1.20, 60.00, 'Pan troglodytes', 19123456, 8, 8, 'ZOOLife Norte'),
(42, 'Carnívoro', 'Ave', 'Corvo', 'Preto', 0.50, 0.70, 'Corvus corax', 15789012, 5, 11, 'ZOOLife Norte'),

(45, 'Carnívoro', 'Mamífero', 'Leopardo', 'Amarelo', 2.00, 70.00, 'Panthera pardus', 17901234, 9, 8, 'ZOOLife Norte'),

(46, 'Herbívoro', 'Mamífero', 'Camelo', 'Bege', 3.00, 600.00, 'Camelus dromedarius', 18012345, 12, 10, 'ZOOLife Norte'),
(47, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19123456, 8, 8, 'ZOOLife Norte'),
(48, 'Herbívoro', 'Ave', 'Cisne Negro', 'Preto', 1.20, 10.00, 'Cygnus atratus', 15789012, 14, 11, 'ZOOLife Norte'),
(49, 'Carnívoro', 'Mamífero', 'Lince', 'Castanho', 1.00, 20.00, 'Lynx lynx', 14678901, 13, 10, 'ZOOLife Norte'),
(50, 'Omnívoro', 'Mamífero', 'Porco Espinho', 'Castanho', 0.60, 15.00, 'Erethizon dorsatum', 16890123, 4, 10, 'ZOOLife Norte'),

(52, 'Carnívoro', 'Ave', 'Águia Dourada', 'Castanho', 1.50, 6.50, 'Aquila chrysaetos', 18012345, 15, 11, 'ZOOLife Norte'),
(53, 'Omnívoro', 'Mamífero', 'Esquilo', 'Castanho', 0.30, 0.50, 'Sciurus vulgaris', 19123456, 4, 10, 'ZOOLife Norte'),
(54, 'Herbívoro', 'Ave', 'Catatua', 'Branca', 0.50, 1.00, 'Cacatua galerita', 15789012, 14, 11, 'ZOOLife Norte'),
(55, 'Carnívoro', 'Mamífero', 'Chita', 'Amarelo', 2.00, 50.00, 'Acinonyx jubatus', 14678901, 13, 10, 'ZOOLife Norte'),

(58, 'Carnívoro', 'Mamífero', 'Lobo Ártico', 'Branco', 1.80, 60.00, 'Canis lupus arctos', 18012345, 1, 7, 'ZOOLife Norte'),
(59, 'Omnívoro', 'Ave', 'Papagaio Cinzento', 'Cinzento', 0.40, 0.50, 'Psittacus erithacus', 19123456, 14, 11, 'ZOOLife Norte'),
(60, 'Herbívoro', 'Mamífero', 'Girafa', 'Amarelo e Marrom', 5.00, 1200.00, 'Giraffa camelopardalis', 15789012, 12, 10, 'ZOOLife Norte'),
(61, 'Omnívoro', 'Mamífero', 'Porquinho da Índia', 'Marrom e Branco', 0.30, 1.00, 'Cavia porcellus', 14678901, 4, 10, 'ZOOLife Norte'),
(62, 'Herbívoro', 'Mamífero', 'Búfalo', 'Preto', 1.80, 800.00, 'Syncerus caffer', 16890123, 12, 10, 'ZOOLife Norte'),
(63, 'Carnívoro', 'Ave', 'Falcão', 'Cinza', 0.60, 1.50, 'Falco peregrinus', 17901234, 15, 11, 'ZOOLife Norte'),

(65, 'Herbívoro', 'Mamífero', 'Camelo', 'Bege', 3.00, 600.00, 'Camelus dromedarius', 19123456, 12, 10, 'ZOOLife Norte'),
(66, 'Carnívoro', 'Mamífero', 'Lobo', 'Cinza', 1.80, 50.00, 'Canis lupus', 15789012, 12, 10, 'ZOOLife Norte'),

(68, 'Omnívoro', 'Ave', 'Pato', 'Branco', 0.50, 1.50, 'Anas platyrhynchos', 16890123, 5, 11, 'ZOOLife Norte'),
(69, 'Carnívoro', 'Mamífero', 'Pantera', 'Preta', 2.20, 100.00, 'Panthera pardus', 17901234, 13, 10, 'ZOOLife Norte'),
(70, 'Herbívoro', 'Mamífero', 'Zebra', 'Preto e Branco', 2.40, 400.00, 'Equus quagga', 18012345, 12, 10, 'ZOOLife Norte'),

(150,'Carnívoro', 'Peixe', 'Tubarão Branco', 'Branco', 6.40, 2000.00, 'Carcharodon carcharias', 19123456, 11, 9, 'ZOOLife Norte'),
(151,'Carnívoro', 'Peixe', 'Tubarão Branco', 'Branco', 6.40, 2000.00, 'Carcharodon carcharias', 19123456, 11, 9, 'ZOOLife Norte'),
(155,'Carnívoro', 'Peixe', 'Barracuda', 'Prateado', 1.80, 30.00, 'Sphyraena barracuda', 15789012, 11, 9, 'ZOOLife Norte'),
(158,'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 16890123, 3,9,'ZOOLife Norte'),
(159,'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 16890123, 3,9,'ZOOLife Norte'),
(160, 'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 16890123, 3,9, 'ZOOLife Norte'),
(161, 'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 16890123, 3,9, 'ZOOLife Norte'),
(162, 'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 16890123, 3,9, 'ZOOLife Norte'),
(163, 'Carnívoro', 'Réptil', 'Tartaruga Marinha', 'Verde', 1.20, 150.00, 'Chelonia mydas', 17901234, 10, 9, 'ZOOLife Norte'),
(164, 'Carnívoro', 'Réptil', 'Tartaruga Marinha', 'Verde', 1.20, 150.00, 'Chelonia mydas', 17901234, 10, 9, 'ZOOLife Norte'),
(165, 'Carnívoro', 'Réptil', 'Tartaruga Marinha', 'Verde', 1.20, 150.00, 'Chelonia mydas', 17901234, 10, 9, 'ZOOLife Norte'),

(166, 'Carnívoro', 'Mamífero', 'Urso Polar', 'Branco', 2.40, 450.00, 'Ursus maritimus', 17901234, 7, 7, 'ZOOLife Norte'),
(35, 'Omnívoro', 'Mamífero', 'Urso Polar', 'Branco', 2.40, 450.00, 'Ursus maritimus', 19123456, 1, 7, 'ZOOLife Norte'),
(167, 'Carnívoro', 'Mamífero', 'Lobo Ártico', 'Branco', 1.80, 60.00, 'Canis lupus arctos', 17901234, 1, 7, 'ZOOLife Norte'),

(168, 'Carnívoro', 'Mamífero', 'Foca', 'Cinza', 1.50, 100.00, 'Phoca vitulina', 17901234, 6, 7, 'ZOOLife Norte'),
(169, 'Carnívoro', 'Mamífero', 'Foca', 'Cinza', 1.50, 100.00, 'Phoca vitulina', 17901234, 6, 7, 'ZOOLife Norte'),
(170, 'Carnívoro', 'Mamífero', 'Foca', 'Cinza', 1.50, 100.00, 'Phoca vitulina', 17901234, 6, 7, 'ZOOLife Norte'),
(171, 'Omnívoro', 'Ave', 'Pinguim', 'Preto e Branco', 0.70, 20.00, 'Aptenodytes forsteri', 16890123, 6, 7, 'ZOOLife Norte'),
(172, 'Omnívoro', 'Ave', 'Pinguim', 'Preto e Branco', 0.70, 20.00, 'Aptenodytes forsteri', 16890123, 6, 7, 'ZOOLife Norte'),
(173, 'Omnívoro', 'Ave', 'Pinguim', 'Preto e Branco', 0.70, 20.00, 'Aptenodytes forsteri', 16890123, 6, 7, 'ZOOLife Norte'),

(180, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19123456, 8, 8, 'ZOOLife Norte'),
(181, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19123456, 8, 8, 'ZOOLife Norte'),
(182, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19123456, 8, 8, 'ZOOLife Norte'),
(183, 'Herbívoro', 'Ave', 'Papagaio', 'Verde', 0.40, 1.00, 'Amazona aestiva', 18012345, 14, 11, 'ZOOLife Norte'),
(184, 'Herbívoro', 'Ave', 'Papagaio', 'Verde', 0.40, 1.00, 'Amazona aestiva', 18012345, 14, 11, 'ZOOLife Norte');


INSERT INTO ZOO.ANIMAL (ID, Dieta, Grupo_Taxonomico, Nome, Cor, Comprimento, Peso, Especie, Veterinario_CC, Habitaculo_ID, Habitat_ID, Nome_JZ) VALUES
(200, 'Carnívoro', 'Mamífero', 'Urso Polar', 'Branco', 2.40, 450.00, 'Ursus maritimus', 19567890, 22, 19, 'ZOOLife Centro'),
(201, 'Carnívoro', 'Mamífero', 'Urso Polar', 'Branco', 2.40, 450.00, 'Ursus maritimus', 19567890, 22, 19, 'ZOOLife Centro'),
(202, 'Carnívoro', 'Mamífero', 'Lobo Ártico', 'Branco', 1.80, 60.00, 'Canis lupus arctos', 19567890, 16, 19, 'ZOOLife Centro'),
(203, 'Carnívoro', 'Mamífero', 'Lobo Ártico', 'Branco', 1.80, 60.00, 'Canis lupus arctos', 19567890, 16, 19, 'ZOOLife Centro'),
(210, 'Carnívoro', 'Mamífero', 'Lobo Ártico', 'Branco', 1.80, 60.00, 'Canis lupus arctos', 19567890, 16, 19, 'ZOOLife Centro'),
(204, 'Carnívoro', 'Mamífero', 'Foca', 'Cinza', 1.50, 100.00, 'Phoca vitulina', 19567890, 21, 19, 'ZOOLife Centro'),
(205, 'Carnívoro', 'Mamífero', 'Foca', 'Cinza', 1.50, 100.00, 'Phoca vitulina', 19567890, 21, 19, 'ZOOLife Centro'),
(206, 'Carnívoro', 'Mamífero', 'Foca', 'Cinza', 1.50, 100.00, 'Phoca vitulina', 19567890, 21, 19, 'ZOOLife Centro'),
(207, 'Omnívoro', 'Ave', 'Pinguim', 'Preto e Branco', 0.70, 20.00, 'Aptenodytes forsteri', 19567890, 21, 19, 'ZOOLife Centro'),
(208, 'Omnívoro', 'Ave', 'Pinguim', 'Preto e Branco', 0.70, 20.00, 'Aptenodytes forsteri', 19567890, 21, 19, 'ZOOLife Centro'),
(209, 'Omnívoro', 'Ave', 'Pinguim', 'Preto e Branco', 0.70, 20.00, 'Aptenodytes forsteri', 19567890, 21, 19, 'ZOOLife Centro'),
(211, 'Omnívoro', 'Ave', 'Pinguim', 'Preto e Branco', 0.70, 20.00, 'Aptenodytes forsteri', 19567890, 21, 19, 'ZOOLife Centro'),

(212, 'Carnívoro', 'Peixe', 'Tubarão Branco', 'Branco', 6.40, 2000.00, 'Carcharodon carcharias', 19678901, 26, 21, 'ZOOLife Centro'),
(213, 'Carnívoro', 'Peixe', 'Tubarão Branco', 'Branco', 6.40, 2000.00, 'Carcharodon carcharias', 19678901, 26, 21, 'ZOOLife Centro'),
(214, 'Carnívoro', 'Peixe', 'Tubarão Branco', 'Branco', 6.40, 2000.00, 'Carcharodon carcharias', 19678901, 26, 21, 'ZOOLife Centro'),
(215, 'Carnívoro', 'Peixe', 'Tubarão Branco', 'Branco', 6.40, 2000.00, 'Carcharodon carcharias', 19678901, 26, 21, 'ZOOLife Centro'),
(216, 'Carnívoro', 'Mamífero', 'Orca', 'Preto e Branco', 9.80, 9000.00, 'Orcinus orca',  19678901, 26, 21, 'ZOOLife Centro'),
(217, 'Carnívoro', 'Peixe', 'Barracuda', 'Prateado', 1.80, 30.00, 'Sphyraena barracuda', 19678901, 26, 21, 'ZOOLife Centro'),
(218, 'Carnívoro', 'Peixe', 'Barracuda', 'Prateado', 1.80, 30.00, 'Sphyraena barracuda', 19678901, 26, 21, 'ZOOLife Centro'),
(219, 'Carnívoro', 'Peixe', 'Barracuda', 'Prateado', 1.80, 30.00, 'Sphyraena barracuda', 19678901, 26, 21, 'ZOOLife Centro'),
(220, 'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 19678901, 18, 21,'ZOOLife Centro'),
(221, 'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 19678901, 18, 21,'ZOOLife Centro'),
(222, 'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 19678901, 18, 21, 'ZOOLife Centro'),
(223, 'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 19678901, 18, 21, 'ZOOLife Centro'),
(224, 'Herbívoro', 'Peixe', 'Peixe-Palhaço', 'Laranja e Branco', 0.10, 0.05, 'Amphiprioninae', 19678901, 18, 21, 'ZOOLife Centro'),
(225, 'Carnívoro', 'Réptil', 'Tartaruga Marinha', 'Verde', 1.20, 150.00, 'Chelonia mydas', 19678901, 25, 21, 'ZOOLife Centro'),
(226, 'Carnívoro', 'Réptil', 'Tartaruga Marinha', 'Verde', 1.20, 150.00, 'Chelonia mydas', 19678901, 25, 21, 'ZOOLife Centro'),
(227, 'Carnívoro', 'Réptil', 'Tartaruga Marinha', 'Verde', 1.20, 150.00, 'Chelonia mydas', 19678901, 25, 21, 'ZOOLife Centro'),
(228, 'Carnívoro', 'Réptil', 'Tartaruga Marinha', 'Verde', 1.20, 150.00, 'Chelonia mydas', 19678901, 25, 21, 'ZOOLife Centro'),
(229, 'Carnívoro', 'Réptil', 'Tartaruga Marinha', 'Verde', 1.20, 150.00, 'Chelonia mydas', 19678901, 25, 21, 'ZOOLife Centro'),
----
(230, 'Carnívoro', 'Ave', 'Águia', 'Castanho', 1.20, 5.00, 'Aquila chrysaetos', 19789012, 30, 23, 'ZOOLife Centro'),
(231, 'Carnívoro', 'Ave', 'Águia', 'Castanho', 1.20, 5.00, 'Aquila chrysaetos', 19789012, 30, 23, 'ZOOLife Centro'),
(232, 'Carnívoro', 'Ave', 'Águia', 'Castanho', 1.20, 5.00, 'Aquila chrysaetos', 19789012, 30, 23, 'ZOOLife Centro'),
(233, 'Carnívoro', 'Ave', 'Águia', 'Castanho', 1.20, 5.00, 'Aquila chrysaetos', 19789012, 30, 23, 'ZOOLife Centro'),
(234, 'Carnívoro', 'Ave', 'Águia', 'Castanho', 1.20, 5.00, 'Aquila chrysaetos', 19789012, 30, 23, 'ZOOLife Centro'),
(235, 'Carnívoro', 'Ave', 'Falcão', 'Cinza', 0.60, 1.50, 'Falco peregrinus', 19789012, 30, 23, 'ZOOLife Centro'),
(236, 'Carnívoro', 'Ave', 'Falcão', 'Cinza', 0.60, 1.50, 'Falco peregrinus', 19789012, 30, 23, 'ZOOLife Centro'),
(237, 'Carnívoro', 'Ave', 'Falcão', 'Cinza', 0.60, 1.50, 'Falco peregrinus', 19789012, 30, 23, 'ZOOLife Centro'),
(238, 'Carnívoro', 'Ave', 'Falcão', 'Cinza', 0.60, 1.50, 'Falco peregrinus', 19789012, 30, 23, 'ZOOLife Centro'),
(239, 'Carnívoro', 'Ave', 'Falcão', 'Cinza', 0.60, 1.50, 'Falco peregrinus', 19789012, 30, 23, 'ZOOLife Centro'),
(240, 'Herbívoro', 'Ave', 'Papagaio', 'Verde', 0.40, 1.00, 'Amazona aestiva', 19890123, 29, 23, 'ZOOLife Centro'),
(241, 'Herbívoro', 'Ave', 'Papagaio', 'Verde', 0.40, 1.00, 'Amazona aestiva', 19890123, 29, 23, 'ZOOLife Centro'),
(242, 'Herbívoro', 'Ave', 'Papagaio', 'Verde', 0.40, 1.00, 'Amazona aestiva', 19890123, 29, 23, 'ZOOLife Centro'),
(243, 'Herbívoro', 'Ave', 'Papagaio', 'Verde', 0.40, 1.00, 'Amazona aestiva', 19890123, 29, 23, 'ZOOLife Centro'),
(244, 'Herbívoro', 'Ave', 'Catatua', 'Branca', 0.50, 1.00, 'Cacatua galerita', 19890123, 29, 23, 'ZOOLife Centro'),
(245, 'Herbívoro', 'Ave', 'Catatua', 'Branca', 0.50, 1.00, 'Cacatua galerita', 19890123, 29, 23, 'ZOOLife Centro'),
(246, 'Herbívoro', 'Ave', 'Catatua', 'Branca', 0.50, 1.00, 'Cacatua galerita', 19890123, 29, 23, 'ZOOLife Centro'),
(247, 'Omnívoro', 'Ave', 'Pato', 'Branco', 0.50, 1.50, 'Anas platyrhynchos', 19890123, 20, 23, 'ZOOLife Centro'),
(248, 'Omnívoro', 'Ave', 'Pato', 'Branco', 0.50, 1.50, 'Anas platyrhynchos', 19890123, 20, 23, 'ZOOLife Centro'),
(249, 'Carnívoro', 'Ave', 'Corvo', 'Preto', 0.50, 0.70, 'Corvus corax', 19890123, 20, 23, 'ZOOLife Centro'),
(250, 'Carnívoro', 'Ave', 'Corvo', 'Preto', 0.50, 0.70, 'Corvus corax', 19890123, 20, 23, 'ZOOLife Centro'),
(251, 'Carnívoro', 'Ave', 'Corvo', 'Preto', 0.50, 0.70, 'Corvus corax', 19890123, 20, 23, 'ZOOLife Centro'),
(252, 'Herbívoro', 'Ave', 'Cisne', 'Branco', 1.20, 10.00, 'Cygnus olor', 19890123, 20, 23,'ZOOLife Centro'),
(253, 'Herbívoro', 'Ave', 'Cisne', 'Branco', 1.20, 10.00, 'Cygnus olor', 19890123, 20, 23,'ZOOLife Centro'),
(254, 'Herbívoro', 'Ave', 'Cisne', 'Branco', 1.20, 10.00, 'Cygnus olor', 19890123, 20, 23,'ZOOLife Centro'),
--
(255, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19901234,  23, 20, 'ZOOLife Centro'),
(256, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19901234,  23, 20, 'ZOOLife Centro'),
(257, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19901234,  23, 20, 'ZOOLife Centro'),
(258, 'Omnívoro', 'Mamífero', 'Macaco', 'Castanho', 1.10, 30.00, 'Macaca mulatta', 19901234,  23, 20, 'ZOOLife Centro'),
(259, 'Omnívoro', 'Mamífero', 'Gorila', 'Preto', 1.80, 200.00, 'Gorilla beringei', 19901234,  23, 20, 'ZOOLife Centro'),
(260, 'Omnívoro', 'Mamífero', 'Gorila', 'Preto', 1.80, 200.00, 'Gorilla beringei', 19901234,  23, 20, 'ZOOLife Centro'),
(261, 'Omnívoro', 'Mamífero', 'Chimpanzé', 'Preto', 1.20, 60.00, 'Pan troglodytes', 19901234, 23, 20, 'ZOOLife Centro'),
(262, 'Omnívoro', 'Mamífero', 'Chimpanzé', 'Preto', 1.20, 60.00, 'Pan troglodytes', 19901234, 23, 20, 'ZOOLife Centro'),
(263, 'Herbívoro', 'Réptil', 'Iguana', 'Verde', 1.50, 5.00, 'Iguana iguana', 19901234, 17, 20, 'ZOOLife Centro'),
(264, 'Herbívoro', 'Réptil', 'Iguana', 'Verde', 1.50, 5.00, 'Iguana iguana', 19901234, 17, 20, 'ZOOLife Centro'),
(265, 'Omnívoro', 'Réptil', 'Camaleão', 'Verde', 0.30, 0.05, 'Chamaeleonidae', 19901234, 17, 20, 'ZOOLife Centro'),
(266, 'Omnívoro', 'Réptil', 'Camaleão', 'Verde', 0.30, 0.05, 'Chamaeleonidae', 19901234, 17, 20, 'ZOOLife Centro'),
(267, 'Carnívoro', 'Mamífero', 'Tigre', 'Laranja', 3.10, 220.00, 'Panthera tigris',   19901234, 24, 20, 'ZOOLife Centro'),
(268, 'Carnívoro', 'Mamífero', 'Tigre', 'Laranja', 3.10, 220.00, 'Panthera tigris',   19901234, 24, 20, 'ZOOLife Centro'),
(269, 'Carnívoro', 'Mamífero', 'Leopardo', 'Amarelo', 2.00, 70.00, 'Panthera pardus', 19901234, 24, 20, 'ZOOLife Centro'),
(270, 'Carnívoro', 'Mamífero', 'Leopardo', 'Amarelo', 2.00, 70.00, 'Panthera pardus', 19901234, 24, 20, 'ZOOLife Centro'),
----
(271, 'Herbívoro', 'Mamífero', 'Zebra', 'Preto e Branco', 2.40, 400.00, 'Equus quagga', 20012345, 27, 22, 'ZOOLife Centro'),
(272, 'Herbívoro', 'Mamífero', 'Zebra', 'Preto e Branco', 2.40, 400.00, 'Equus quagga', 20012345, 27, 22, 'ZOOLife Centro'),
(273, 'Herbívoro', 'Mamífero', 'Búfalo', 'Preto', 1.80, 800.00, 'Syncerus caffer', 20012345, 27, 22, 'ZOOLife Centro'),
(274, 'Herbívoro', 'Mamífero', 'Búfalo', 'Preto', 1.80, 800.00, 'Syncerus caffer', 20012345, 27, 22, 'ZOOLife Centro'),
(275,'Herbívoro', 'Mamífero', 'Elefante', 'Cinza', 3.00, 6000.00, 'Loxodonta africana', 20012345, 27, 22, 'ZOOLife Centro'),
(276,'Herbívoro', 'Mamífero', 'Elefante', 'Cinza', 3.00, 6000.00, 'Loxodonta africana', 20012345, 27, 22, 'ZOOLife Centro'),
(277, 'Carnívoro', 'Mamífero', 'Hiena', 'Castanho', 1.50, 60.00, 'Crocuta crocuta', 20012345, 28, 22, 'ZOOLife Centro'),
(278, 'Carnívoro', 'Mamífero', 'Hiena', 'Castanho', 1.50, 60.00, 'Crocuta crocuta', 20012345, 28, 22, 'ZOOLife Centro'),
(279, 'Carnívoro', 'Mamífero', 'Leão', 'Amarelo', 2.50, 250.00, 'Panthera leo', 20012345, 28, 22, 'ZOOLife Centro'),
(280, 'Carnívoro', 'Mamífero', 'Leão', 'Amarelo', 2.50, 250.00, 'Panthera leo', 20012345, 28, 22, 'ZOOLife Centro'),
(281, 'Herbívoro', 'Mamífero', 'Girafa', 'Amarelo', 5.00, 1200.00, 'Giraffa camelopardalis', 20012345, 19, 22, 'ZOOLife Centro'),
(282, 'Herbívoro', 'Mamífero', 'Girafa', 'Amarelo', 5.00, 1200.00, 'Giraffa camelopardalis', 20012345, 19, 22, 'ZOOLife Centro');


INSERT INTO ZOO.RESPONSAVEL_POR(T_Numero_CC, Nome_JZ, Habitat_ID) VALUES
(67890123, 'ZOOLife Norte', 7),
(78901234, 'ZOOLife Norte', 8),
(89012345, 'ZOOLife Norte', 9),
(90123456, 'ZOOLife Norte', 10),
(10234567, 'ZOOLife Norte', 11),
(42456789, 'ZOOLife Centro', 19),
(50234567, 'ZOOLife Centro', 20),
(42456789, 'ZOOLife Centro', 21),
(19345678, 'ZOOLife Centro', 22),
(47901234, 'ZOOLife Centro', 23);


INSERT INTO ZOO.ANIMAL_RELACIONADO(Animal1_ID, Animal2_ID, Relacao) VALUES
(200, 201, 'irmãos'), -- Urso Polar
(202, 203, 'irmãos'), -- Lobo Ártico
(204, 205, 'irmãos'), -- Foca
(207, 208, 'irmãos'), -- Pinguim
(212, 213, 'irmãos'), -- Tubarão Branco
(217, 218, 'irmãos'), -- Barracuda
(220, 221, 'irmãos'), -- Peixe-Palhaço
(225, 226, 'irmãos'), -- Tartaruga Marinha
(230, 231, 'irmãos'), -- Águia
(235, 236, 'irmãos'), -- Falcão
(240, 241, 'irmãos'), -- Papagaio
(244, 245, 'irmãos'), -- Catatua
(247, 248, 'irmãos'), -- Pato
(249, 250, 'irmãos'), -- Corvo
(252, 253, 'irmãos'), -- Cisne
(255, 256, 'irmãos'), -- Macaco
(259, 260, 'irmãos'), -- Gorila
(267, 268, 'casal'), -- Tigre
(269, 270, 'casal'), -- Leopardo
(255, 257, 'pai-filho'); -- Macaco

