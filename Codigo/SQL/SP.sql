USE p8g5;

--Procedure para criar jardim zoologico
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarZOO
go
CREATE PROCEDURE ZOO.sp_adicionarZOO
    @nome varchar(30),
    @morada varchar(50),
    @estado varchar(10)
AS
    BEGIN
        begin try
            begin transaction
                INSERT INTO ZOO.JARDIM_ZOOLOGICO VALUES (@nome, @morada, @estado);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar jardim zoologico! Algum dado está incorreto', 16, 1);
        end catch
    END
go 

--Procedure para remover jardim zoologico
DROP PROCEDURE IF EXISTS ZOO.sp_removerZOO
go
CREATE PROCEDURE ZOO.sp_removerZOO
    @nome varchar(30)
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.JARDIM_ZOOLOGICO
                WHERE Nome = @nome;
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover jardim zoologico! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para adicionar animais
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarAnimal;
go
CREATE PROCEDURE ZOO.sp_adicionarAnimal 
    @dieta varchar(50),
    @grupo_taxonomico varchar(30),
    @nome varchar(30),
    @cor varchar(30),
    @Comprimento decimal(10,2),
    @peso decimal(10,2),
    @especie varchar(30),
    @veterinario_cc int,
    @habitaculo_id int,
    @habitat_id int,
    @nome_jz varchar(30)
AS
    BEGIN 
        begin try 
            begin transaction
                DECLARE @id int;
                SELECT @id = MAX(ID) + 1 FROM ZOO.ANIMAL;
                INSERT INTO ZOO.ANIMAL VALUES (
                   @id, @dieta, @grupo_taxonomico, @nome, @cor, @comprimento, @peso, @especie, @veterinario_cc, @habitaculo_id, @habitat_id, @nome_jz);
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível adicionar animal! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para alterar animal
DROP PROCEDURE IF EXISTS ZOO.sp_alterarAnimal;
go
CREATE PROCEDURE ZOO.sp_alterarAnimal 
    @id int,
    @dieta varchar(50),
    @grupo_taxonomico varchar(30),
    @nome varchar(30),
    @cor varchar(30),
    @Comprimento decimal(10,2),
    @peso decimal(10,2),
    @especie varchar(30),
    @veterinario_cc int,
    @habitaculo_id int,
    @habitat_id int,
    @nome_jz varchar(30)
AS
    BEGIN 
        begin try 
            begin transaction
                UPDATE ZOO.ANIMAL
                SET Dieta = @dieta, Grupo_Taxonomico = @grupo_taxonomico, Nome = @nome, Cor = @cor, Comprimento = @comprimento, Peso = @peso, Especie = @especie, Veterinario_CC = @veterinario_cc, Habitaculo_ID = @habitaculo_id, Habitat_ID = @habitat_id, Nome_JZ = @nome_jz
                WHERE ID = @id;
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível alterar animal! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para remover animal
DROP PROCEDURE IF EXISTS ZOO.sp_DeleteAnimal;
go
CREATE PROCEDURE ZOO.sp_DeleteAnimal
    @ID INT
AS
BEGIN
    begin try
        begin transaction
            DELETE FROM ZOO.ANIMAL_RELACIONADO
            WHERE Animal1_ID = @ID or Animal2_ID = @ID;
            DELETE FROM ZOO.ANIMAL
            WHERE ID = @ID;
        commit transaction
    end try
    begin catch
        rollback transaction
        RAISERROR('Impossível remover animal! Algum dado está incorreto', 16, 1);
    end catch
END
go

--Procedure para transferir animal
DROP PROCEDURE IF EXISTS ZOO.sp_transferirAnimal;
go
CREATE PROCEDURE ZOO.sp_transferirAnimal 
    @id int,
    @veterinario_cc int,
    @habitaculo_id int,
    @habitat_id int,
    @nome_jz varchar(30)
AS
    BEGIN 
        begin try 
            begin transaction
                UPDATE ZOO.ANIMAL
                SET Veterinario_CC = @veterinario_cc, Habitaculo_ID = @habitaculo_id, Habitat_ID = @habitat_id, Nome_JZ = @nome_jz
                WHERE ID = @id;
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível transferir animal! Algum dado está incorreto', 16, 1);
        end catch
    End
go

--Procedure para adicionar animal relacionado
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarAnimalRelacionado;
go
CREATE PROCEDURE ZOO.sp_adicionarAnimalRelacionado
    @animal1_id int,
    @animal2_id int,
    @relacao varchar(50)
AS
    BEGIN
        begin try
            begin transaction
                INSERT INTO ZOO.ANIMAL_RELACIONADO VALUES (@animal1_id, @animal2_id, @relacao);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar animal relacionado! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para remover animal relacionado
DROP PROCEDURE IF EXISTS ZOO.sp_removerAnimalRelacionado;
go
CREATE PROCEDURE ZOO.sp_removerAnimalRelacionado
    @animal1_id int,
    @animal2_id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.ANIMAL_RELACIONADO
                WHERE (Animal1_ID = @animal1_id AND Animal2_ID = @animal2_id) OR (Animal1_ID = @animal2_id AND Animal2_ID = @animal1_id);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover animal relacionado! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para adicionar veterinario
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarVeterinario;
go
CREATE PROCEDURE ZOO.sp_adicionarVeterinario 
    @cc int,
    @nome varchar(40),
    @genero character,
    @data_nascimento date,
    @jardim_zoologico varchar(30),
    --num_funcionario e calculado
    @data_ingresso date,
    @tipo_contrato char(9),
    @salario decimal(10,2),
    @data_inicio_contrato date,
    @data_fim_contrato date

AS 
    BEGIN 
        begin try 
            begin transaction
                DECLARE @num_funcionario int;
                DECLARE @vet_gerente_id int;

                SELECT @num_funcionario = MAX(Num_Funcionario) + 1 FROM ZOO.FUNCIONARIO;
                
                SELECT @vet_gerente_id = F_Numero_CC
                FROM ZOO.VETERINARIO
                WHERE GerenteVet_Numero IS NULL

                INSERT INTO ZOO.PESSOA VALUES (@cc, @nome, @genero, @data_nascimento);
                INSERT INTO ZOO.FUNCIONARIO VALUES (@cc, @jardim_zoologico, @num_funcionario, @data_ingresso);
                INSERT INTO ZOO.CONTRATO VALUES (@cc, @tipo_contrato, @salario, @data_inicio_contrato, @data_fim_contrato);
                INSERT INTO ZOO.VETERINARIO VALUES (@cc, @vet_gerente_id);
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível adicionar veterinario! Algum dado está incorreto', 16, 1);
        end catch
    End
go

--Procedure para remover veterinario
DROP PROCEDURE IF EXISTS ZOO.sp_removerVeterinario;
GO
CREATE PROCEDURE ZOO.sp_removerVeterinario
    @cc int
AS
BEGIN 
    BEGIN TRY 
        BEGIN TRANSACTION
            DECLARE @previous_nome_jz INT;
            DECLARE @gerente_vet_numero INT;

            -- Get the previous nome_jz
            SELECT @previous_nome_jz = Nome_JZ
            FROM ZOO.VETERINARIO JOIN ZOO.FUNCIONARIO ON F_Numero_CC = Numero_CC
            WHERE F_Numero_CC = @cc;

            -- Get the vet gerente id
            SELECT @gerente_vet_numero = GerenteVet_Numero
            FROM ZOO.VETERINARIO
            WHERE F_Numero_cc = @cc;

            -- If gerente_vet_numero is null, select the vet with longer time in the zoo and set him as the gerente
            IF @gerente_vet_numero IS NULL
            BEGIN
                SELECT TOP 1 @gerente_vet_numero = F_Numero_CC
                FROM ZOO.VETERINARIO join ZOO.FUNCIONARIO ON ZOO.VETERINARIO.F_Numero_CC = ZOO.FUNCIONARIO.Numero_CC
                WHERE F_Numero_CC != @cc AND ZOO.FUNCIONARIO.Nome_JZ = @previous_nome_jz
                ORDER BY Data_ingresso ASC;

                UPDATE ZOO.VETERINARIO
                SET GerenteVet_Numero = @gerente_vet_numero
                FROM ZOO.VETERINARIO AS v
                JOIN ZOO.FUNCIONARIO AS f ON v.F_Numero_CC = f.Numero_CC
                WHERE F_Numero_CC != @cc AND f.Nome_JZ = @previous_nome_jz;

                UPDATE ZOO.VETERINARIO
                SET GerenteVet_Numero = NULL
                WHERE F_Numero_CC = @gerente_vet_numero;

                UPDATE ZOO.ANIMAL
                SET Veterinario_CC = @gerente_vet_numero
                WHERE Veterinario_CC = @cc;
            END

            -- Remove the veterinarian
            DELETE FROM ZOO.VETERINARIO
            WHERE F_Numero_cc = @cc;
            
            DELETE FROM ZOO.CONTRATO
            WHERE F_Numero_CC = @cc;

            DELETE FROM ZOO.FUNCIONARIO
            WHERE Numero_cc = @cc;

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH 
        ROLLBACK TRANSACTION
        RAISERROR('Impossível remover veterinário! Algum dado está incorreto', 16, 1);
    END CATCH
END
GO
        
--Adicionar gerente
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarGerente;
GO

CREATE PROCEDURE ZOO.sp_adicionarGerente
    @cc int,
    @nome varchar(40),
    @genero char(1),
    @data_nascimento date,
    @jardim_zoologico varchar(30),
    --num_funcionario e calculado
    @data_ingresso date,
    @tipo_contrato char(9),
    @salario decimal(10,2),
    @data_inicio_contrato date,
    @data_fim_contrato date

AS 
BEGIN 
    BEGIN TRY 
        BEGIN TRANSACTION
            DECLARE @num_funcionario int;

            SELECT @num_funcionario = MAX(Num_Funcionario) + 1 FROM ZOO.FUNCIONARIO;

            INSERT INTO ZOO.PESSOA VALUES (@cc, @nome, @genero, @data_nascimento);
            INSERT INTO ZOO.FUNCIONARIO VALUES (@cc, @jardim_zoologico, @num_funcionario, @data_ingresso);
            INSERT INTO ZOO.CONTRATO VALUES (@cc, @tipo_contrato, @salario, @data_inicio_contrato, @data_fim_contrato);
            INSERT INTO ZOO.GERENTE VALUES (@cc, @jardim_zoologico);
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH 
        ROLLBACK TRANSACTION
        RAISERROR('Impossível adicionar gerente! Algum dado está incorreto', 16, 1);
    END CATCH
END
GO


--Eliminar gerente da tabela
DROP PROCEDURE IF EXISTS ZOO.sp_removerGerente
go
CREATE PROCEDURE ZOO.sp_removerGerente
    @id int
AS
    BEGIN
        begin try
            begin TRANSACTION
                DELETE FROM ZOO.GERENTE
                WHERE ZOO.GERENTE.F_Numero_CC=@id
                
                DELETE FROM ZOO.CONTRATO 
                WHERE ZOO.CONTRATO.F_Numero_CC=@id

                DELETE FROM ZOO.FUNCIONARIO
                WHERE ZOO.FUNCIONARIO.Numero_CC=@id
                
            commit TRANSACTION
        end try
        begin catch
            rollback TRANSACTION
            RAISERROR('Impossível remover gerente! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para adicionar seguranca
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarSeguranca;
go
CREATE PROCEDURE ZOO.sp_adicionarSeguranca
    @cc int,
    @nome varchar(40),
    @genero character,
    @data_nascimento date,
    @jardim_zoologico varchar(30),
    --num_funcionario e calculado
    @data_ingresso date,
    @tipo_contrato char(9),
    @salario decimal(10,2),
    @data_inicio_contrato date,
    @data_fim_contrato date,
    @recinto_id int=NULL

AS
    BEGIN
        begin try 
            begin transaction
                DECLARE @num_funcionario int;
                DECLARE @seg_gerente_id int;

                SELECT @num_funcionario = MAX(Num_Funcionario) + 1 FROM ZOO.FUNCIONARIO;
                
                SELECT @seg_gerente_id = F_Numero_CC
                FROM ZOO.SEGURANCA
                WHERE GerenteSeguranca_Numero IS NULL

                INSERT INTO ZOO.PESSOA VALUES (@cc, @nome, @genero, @data_nascimento);
                INSERT INTO ZOO.FUNCIONARIO VALUES (@cc, @jardim_zoologico, @num_funcionario, @data_ingresso);
                INSERT INTO ZOO.CONTRATO VALUES (@cc, @tipo_contrato, @salario, @data_inicio_contrato, @data_fim_contrato);
                INSERT INTO ZOO.SEGURANCA VALUES (@cc, @jardim_zoologico, @recinto_id, @seg_gerente_id);
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível adicionar seguranca! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Eliminar seguranca
DROP PROCEDURE IF EXISTS ZOO.sp_removerSeguranca
go
CREATE PROCEDURE ZOO.sp_removerSeguranca
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @previous_nome_jz varchar(30);
                DECLARE @gerente_seg_numero INT;

                SELECT @previous_nome_jz = Nome_JZ
                FROM ZOO.SEGURANCA
                WHERE F_Numero_CC = @id;

                SELECT @gerente_seg_numero = GerenteSeguranca_Numero
                FROM ZOO.SEGURANCA
                WHERE F_Numero_CC = @id;

                if @gerente_seg_numero is null
                BEGIN
                    SELECT TOP 1 @gerente_seg_numero = F_Numero_CC
                    FROM ZOO.SEGURANCA JOIN ZOO.FUNCIONARIO ON ZOO.SEGURANCA.F_Numero_CC = ZOO.FUNCIONARIO.Numero_CC
                    WHERE F_Numero_CC != @id AND ZOO.SEGURANCA.Nome_JZ = @previous_nome_jz
                    ORDER BY Data_ingresso ASC;

                    UPDATE ZOO.SEGURANCA
                    SET GerenteSeguranca_Numero = @gerente_seg_numero
                    WHERE F_Numero_CC != @id AND Nome_JZ = @previous_nome_jz;

                    UPDATE ZOO.SEGURANCA
                    SET GerenteSeguranca_Numero = NULL
                    WHERE F_Numero_CC = @gerente_seg_numero;
                END
            
                DELETE FROM ZOO.SEGURANCA
                WHERE ZOO.SEGURANCA.F_Numero_CC=@id
                
                DELETE FROM ZOO.CONTRATO
                WHERE ZOO.CONTRATO.F_Numero_CC=@id
                
                DELETE FROM ZOO.FUNCIONARIO
                WHERE ZOO.FUNCIONARIO.Numero_CC=@id

            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover segurança! Algum dado está incorreto', 16, 1);
        end catch
    END
go


--Procedure para adicionar tratador
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarTratador;
go
CREATE PROCEDURE ZOO.sp_adicionarTratador
    @cc int,
    @nome varchar(40),
    @genero character,
    @data_nascimento date,
    @jardim_zoologico varchar(30),
    --num_funcionario e calculado
    @data_ingresso date,
    @tipo_contrato char(9),
    @salario decimal(10,2),
    @data_inicio_contrato date,
    @data_fim_contrato date
AS
    BEGIN
        begin try 
            begin transaction
                DECLARE @num_funcionario int;
                DECLARE @trat_gerente_id int;

                SELECT @num_funcionario = MAX(Num_Funcionario) + 1 FROM ZOO.FUNCIONARIO;
                
                SELECT @trat_gerente_id = F_Numero_CC
                FROM ZOO.TRATADOR
                WHERE GerenteTratador_Numero IS NULL

                INSERT INTO ZOO.PESSOA VALUES (@cc, @nome, @genero, @data_nascimento);
                INSERT INTO ZOO.FUNCIONARIO VALUES (@cc, @jardim_zoologico, @num_funcionario, @data_ingresso);
                INSERT INTO ZOO.CONTRATO VALUES (@cc, @tipo_contrato, @salario, @data_inicio_contrato, @data_fim_contrato);
                INSERT INTO ZOO.TRATADOR VALUES (@cc, @trat_gerente_id);
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível adicionar tratador! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Eliminar tratador
DROP PROCEDURE IF EXISTS ZOO.sp_removerTratador
go
CREATE PROCEDURE ZOO.sp_removerTratador
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @previous_nome_jz int;
                DECLARE @gerente_trat_numero INT;

                SELECT @gerente_trat_numero = GerenteTratador_Numero
                FROM ZOO.TRATADOR
                WHERE F_Numero_CC = @id;

                if @gerente_trat_numero is null
                BEGIN
                    SELECT TOP 1 @gerente_trat_numero = F_Numero_CC
                    FROM ZOO.TRATADOR JOIN ZOO.FUNCIONARIO ON ZOO.TRATADOR.F_Numero_CC = ZOO.FUNCIONARIO.Numero_CC
                    WHERE F_Numero_CC != @id AND Nome_JZ = @previous_nome_jz
                    ORDER BY Data_ingresso ASC;

                    UPDATE t
                    SET t.GerenteTratador_Numero = @gerente_trat_numero
                    FROM ZOO.TRATADOR AS t
                    JOIN ZOO.FUNCIONARIO AS f ON t.F_Numero_CC = f.Numero_CC
                    WHERE t.F_Numero_CC != @id AND f.Nome_JZ = @previous_nome_jz;


                    UPDATE ZOO.TRATADOR
                    SET GerenteTratador_Numero = NULL
                    WHERE F_Numero_CC = @gerente_trat_numero;
                END

                UPDATE ZOO.RESPONSAVEL_POR
                SET T_Numero_CC = @gerente_trat_numero
                WHERE T_Numero_CC = @id;
            
                DELETE FROM ZOO.TRATADOR
                WHERE ZOO.TRATADOR.F_Numero_CC=@id
                
                DELETE FROM ZOO.CONTRATO
                WHERE ZOO.CONTRATO.F_Numero_CC=@id
                
                DELETE FROM ZOO.FUNCIONARIO
                WHERE ZOO.FUNCIONARIO.Numero_CC=@id

            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover tratador! Algum dado está incorreto', 16, 1);
        end catch
    END
go 


--Procedure para adicionar trabalhador de restauracao
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarTrabalhadorRestauracao;
GO
CREATE PROCEDURE ZOO.sp_adicionarTrabalhadorRestauracao
    @cc int,
    @nome varchar(40),
    @genero character,
    @data_nascimento date,
    @jardim_zoologico varchar(30),
    --num_funcionario e calculado
    @data_ingresso date,
    @tipo_contrato char(9),
    @salario decimal(10,2),
    @data_inicio_contrato date,
    @data_fim_contrato date,
    @restaurante_id int
AS
    BEGIN
        begin try 
            begin transaction
                DECLARE @num_funcionario int;

                SELECT @num_funcionario = MAX(Num_Funcionario) + 1 FROM ZOO.FUNCIONARIO;

                INSERT INTO ZOO.PESSOA VALUES (@cc, @nome, @genero, @data_nascimento);
                INSERT INTO ZOO.FUNCIONARIO VALUES (@cc, @jardim_zoologico, @num_funcionario, @data_ingresso);
                INSERT INTO ZOO.CONTRATO VALUES (@cc, @tipo_contrato, @salario, @data_inicio_contrato, @data_fim_contrato);
                INSERT INTO ZOO.TRABALHADOR_RESTAURACAO VALUES (@cc, @jardim_zoologico, @restaurante_id);
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível adicionar trabalhador de restauração! Algum dado está incorreto', 16, 1);
        end catch
    END
go 

--Eliminar trabalhador de restauracao
DROP PROCEDURE IF EXISTS ZOO.sp_removerTrabalhadorRestauracao
go
CREATE PROCEDURE ZOO.sp_removerTrabalhadorRestauracao
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.TRABALHADOR_RESTAURACAO
                WHERE ZOO.TRABALHADOR_RESTAURACAO.F_Numero_CC=@id

                DELETE FROM ZOO.CONTRATO 
                WHERE ZOO.CONTRATO.F_Numero_CC=@id
                
                DELETE FROM ZOO.FUNCIONARIO
                WHERE ZOO.FUNCIONARIO.Numero_CC=@id
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover trabalhador de restauração! Algum dado está incorreto', 16, 1);
        end catch
    END
go 

--Procedure para adicionar funcionario de bilheterira
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarFuncionarioBilheteira;
go
CREATE PROCEDURE ZOO.sp_adicionarFuncionarioBilheteira
    @cc int,
    @nome varchar(40),
    @genero character,
    @data_nascimento date,
    @jardim_zoologico varchar(30),
    --num_funcionario e calculado
    @data_ingresso date,
    @tipo_contrato char(9),
    @salario decimal(10,2),
    @data_inicio_contrato date,
    @data_fim_contrato date,
    @bilheteira_id int
AS
    BEGIN
        begin try 
            begin transaction
                DECLARE @num_funcionario int;

                SELECT @num_funcionario = MAX(Num_Funcionario) + 1 FROM ZOO.FUNCIONARIO;

                INSERT INTO ZOO.PESSOA VALUES (@cc, @nome, @genero, @data_nascimento);
                INSERT INTO ZOO.FUNCIONARIO VALUES (@cc, @jardim_zoologico, @num_funcionario, @data_ingresso);
                INSERT INTO ZOO.CONTRATO VALUES (@cc, @tipo_contrato, @salario, @data_inicio_contrato, @data_fim_contrato);
                INSERT INTO ZOO.FUNCIONARIO_BILHETEIRA VALUES (@cc, @jardim_zoologico, @bilheteira_id);
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível adicionar funcionário de bilheteira! Algum dado está incorreto', 16, 1);
        end catch
    END
go

-- Procedure para eliminar funcionario de bilheteira
DROP PROCEDURE IF EXISTS ZOO.sp_removerFuncionarioBilheteira;
go
CREATE PROCEDURE ZOO.sp_removerFuncionarioBilheteira
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.FUNCIONARIO_BILHETEIRA
                WHERE ZOO.FUNCIONARIO_BILHETEIRA.F_Numero_CC=@id

                DELETE FROM ZOO.CONTRATO 
                WHERE ZOO.CONTRATO.F_Numero_CC=@id
                
                DELETE FROM ZOO.FUNCIONARIO
                WHERE ZOO.FUNCIONARIO.Numero_CC=@id
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover funcionário de bilheteira! Algum dado está incorreto', 16, 1);
        end catch
    END
go

-- Adicionar funcionario de limpeza
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarFuncionarioLimpeza;
go
CREATE PROCEDURE ZOO.sp_adicionarFuncionarioLimpeza
    @cc int,
    @nome varchar(40),
    @genero character,
    @data_nascimento date,
    @jardim_zoologico varchar(30),
    --num_funcionario e calculado
    @data_ingresso date,
    @tipo_contrato char(9),
    @salario decimal(10,2),
    @data_inicio_contrato date,
    @data_fim_contrato date
AS
    BEGIN
        begin try 
            begin transaction
                DECLARE @num_funcionario int;

                SELECT @num_funcionario = MAX(Num_Funcionario) + 1 FROM ZOO.FUNCIONARIO;

                INSERT INTO ZOO.PESSOA VALUES (@cc, @nome, @genero, @data_nascimento);
                INSERT INTO ZOO.FUNCIONARIO VALUES (@cc, @jardim_zoologico, @num_funcionario, @data_ingresso);
                INSERT INTO ZOO.CONTRATO VALUES (@cc, @tipo_contrato, @salario, @data_inicio_contrato, @data_fim_contrato);
                INSERT INTO ZOO.FUNCIONARIO_LIMPEZA VALUES (@cc);
            commit transaction
        end try
        begin catch 
            rollback transaction
            RAISERROR('Impossível adicionar funcionário de limpeza! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Eliminar funcionario de limpeza
DROP PROCEDURE IF EXISTS ZOO.sp_removerFuncionarioLimpeza
go
CREATE PROCEDURE ZOO.sp_removerFuncionarioLimpeza
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.LIMPA
                WHERE ZOO.LIMPA.FL_Numero_CC=@id

                DELETE FROM ZOO.FUNCIONARIO_LIMPEZA
                WHERE ZOO.FUNCIONARIO_LIMPEZA.F_Numero_CC=@id

                DELETE FROM ZOO.CONTRATO 
                WHERE ZOO.CONTRATO.F_Numero_CC=@id
                
                DELETE FROM ZOO.FUNCIONARIO
                WHERE ZOO.FUNCIONARIO.Numero_CC=@id
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover funcionário de limpeza! Algum dado está incorreto', 16, 1);
        end catch
    END
go

-- Procedure para adicionar recinto para limpar a funcionario de bilheteira
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarLimpa;
go 
CREATE PROCEDURE ZOO.sp_adicionarLimpa
    @nome_jz varchar(30),
    @recinto_id int,
    @FL_Numero_CC int
AS 
    BEGIN
        begin try
            begin transaction
                INSERT INTO ZOO.LIMPA VALUES (@nome_jz, @recinto_id, @FL_Numero_CC);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar recinto a limpar! Algum dado está incorreto', 16, 1);
        end catch
    END
go 

-- Procedure para remover recinto para limpar a funcionario de bilheteira
DROP PROCEDURE IF EXISTS ZOO.sp_removerLimpa;
go
CREATE PROCEDURE ZOO.sp_removerLimpa
    @nome_jz varchar(30),
    @recinto_id int,
    @FL_Numero_CC int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.LIMPA
                WHERE Nome_JZ = @nome_jz AND Recinto_ID = @recinto_id AND FL_Numero_CC = @FL_Numero_CC;
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover recintoa limpar! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para definir um veterinario como gerente
DROP PROCEDURE IF EXISTS ZOO.sp_definirVeterinarioComoGerente;
go
CREATE PROCEDURE ZOO.sp_definirVeterinarioComoGerente
    @cc int
AS
    BEGIN
        begin try
            begin transaction
                IF EXISTS(SELECT * FROM ZOO.VETERINARIO WHERE F_Numero_CC = @cc) 
                BEGIN
                    DECLARE @nome_jz VARCHAR(30);

                    SELECT @nome_jz = Nome_JZ
                    FROM ZOO.VETERINARIO JOIN ZOO.FUNCIONARIO ON ZOO.VETERINARIO.F_Numero_CC = ZOO.FUNCIONARIO.Numero_CC
                    WHERE ZOO.VETERINARIO.F_Numero_CC = @cc;

                    UPDATE ZOO.VETERINARIO
                    SET GerenteVet_Numero = @cc
                    FROM ZOO.VETERINARIO AS v
                    JOIN ZOO.FUNCIONARIO AS f ON v.F_Numero_CC = f.Numero_CC
                    WHERE v.F_Numero_CC != @cc AND f.Nome_JZ = @nome_jz;
                    

                    UPDATE ZOO.VETERINARIO
                    SET GerenteVet_Numero = NULL
                    WHERE F_Numero_CC = @cc
                END
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível definir veterinário como gerente! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para definir um seguranca como gerente
DROP PROCEDURE IF EXISTS ZOO.sp_definirSegurancaComoGerente;
go
CREATE PROCEDURE ZOO.sp_definirSegurancaComoGerente
    @cc int
AS
    BEGIN
        begin try
            begin transaction
                IF EXISTS(SELECT * FROM ZOO.SEGURANCA WHERE F_Numero_CC = @cc) 
                BEGIN

                    UPDATE ZOO.SEGURANCA
                    SET GerenteSeguranca_Numero = @cc
                    FROM ZOO.SEGURANCA as s
                    JOIN ZOO.FUNCIONARIO as f ON s.F_Numero_CC = f.Numero_CC
                    WHERE s.F_Numero_CC != @cc AND f.Nome_JZ = s.Nome_JZ;

                    UPDATE ZOO.SEGURANCA
                    SET GerenteSeguranca_Numero = NULL
                    WHERE F_Numero_CC = @cc
                END
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível definir segurança como gerente! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para definir um tratador como gerente
DROP PROCEDURE IF EXISTS ZOO.sp_definirTratadorComoGerente;
go
CREATE PROCEDURE ZOO.sp_definirTratadorComoGerente
    @cc int
AS
    BEGIN
        begin try
            begin transaction
                IF EXISTS(SELECT * FROM ZOO.TRATADOR WHERE F_Numero_CC = @cc) 
                BEGIN
                    -- Encontrar zoo do tratador 
                    DECLARE @nome_jz varchar(30);
                    SELECT @nome_jz = ZOO.FUNCIONARIO.Nome_JZ
                    FROM ZOO.TRATADOR JOIN ZOO.FUNCIONARIO ON ZOO.TRATADOR.F_Numero_CC = ZOO.FUNCIONARIO.Numero_CC
                    WHERE ZOO.TRATADOR.F_Numero_CC = @cc;

                    UPDATE ZOO.TRATADOR
                    SET GerenteTratador_Numero = @cc
                    FROM ZOO.TRATADOR AS t
                    JOIN ZOO.FUNCIONARIO AS f ON t.F_Numero_CC = f.Numero_CC
                    WHERE t.F_Numero_CC != @cc AND f.Nome_JZ = @nome_jz;

                    UPDATE ZOO.TRATADOR
                    SET GerenteTratador_Numero = NULL
                    WHERE F_Numero_CC = @cc
                END
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível definir tratador como gerente! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para adicionar recinto

DROP PROCEDURE IF EXISTS ZOO.sp_adicionarRecinto;
go 
CREATE PROCEDURE ZOO.sp_adicionarRecinto
    @nome_jz varchar(30),
    @nome varchar(30),
    @estado varchar(10)
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @id int;

                SELECT @id = MAX(ID) + 1 FROM ZOO.RECINTO;

                INSERT INTO ZOO.RECINTO VALUES (@id, @nome_jz, @nome, @estado);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar recinto! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para remover recinto (não especificado)
DROP PROCEDURE IF EXISTS ZOO.sp_removerRecinto;
go
CREATE PROCEDURE ZOO.sp_removerRecinto
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.LIMPA
                WHERE Recinto_ID = @id;

                DELETE FROM ZOO.RECINTO 
                WHERE ID = @id;
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover recinto! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para criar um habitat
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarHabitat;
go
CREATE PROCEDURE ZOO.sp_adicionarHabitat
    @nome_jz varchar(30),
    @nome varchar(30),
    @estado varchar(10)
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @id int;

                SELECT @id = MAX(ID) + 1 FROM ZOO.RECINTO;

                INSERT INTO ZOO.RECINTO VALUES (@id, @nome_jz, @nome, @estado);
                INSERT INTO ZOO.HABITAT VALUES (@id, @nome_jz);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar habitat! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para remover habitat
DROP PROCEDURE IF EXISTS ZOO.sp_removerHabitat;
go
CREATE PROCEDURE ZOO.sp_removerHabitat
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.LIMPA
                WHERE Recinto_ID = @id;

                DELETE FROM ZOO.HABITAT
                WHERE Recinto_ID = @id;

                DELETE FROM ZOO.RECINTO 
                WHERE ID = @id;
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover habitat! Algum dado está incorreto', 16, 1);
        end catch
    END
go 

--Procedure para adicionar habitaculo
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarHabitaculo;
go
CREATE PROCEDURE ZOO.sp_adicionarHabitaculo
    @nome_jz varchar(30),
    @recinto_id int,
    @tamanho varchar(30),
    @max_animais int
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @id int;

                SELECT @id = MAX(ID) + 1 FROM ZOO.HABITACULO;

                INSERT INTO ZOO.HABITACULO VALUES (@id, @recinto_id, @nome_jz, @tamanho, @max_animais);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar habitáculo! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para remover habitaculo
DROP PROCEDURE IF EXISTS ZOO.sp_removerHabitaculo;
go
CREATE PROCEDURE ZOO.sp_removerHabitaculo
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.HABITACULO
                WHERE ID = @id;
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover habitáculo! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para adicionar 
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarBilheteira;
go
CREATE PROCEDURE ZOO.sp_adicionarBilheteira
    @nome_jz varchar(30),
    @nome varchar(30),
    @estado varchar(10)
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @recinto_id int;

                SELECT @recinto_id = MAX(ID) + 1 FROM ZOO.RECINTO;

                INSERT INTO ZOO.RECINTO VALUES (@recinto_id, @nome_jz, @nome, @estado);
                INSERT INTO ZOO.BILHETEIRA VALUES (@recinto_id, @nome_jz);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar bilheteira! Algum dado está incorreto', 16, 1);
        end catch
    END
go 


--Procedure para remover bilheteira
DROP PROCEDURE IF EXISTS ZOO.sp_removerBilheteira;
go
CREATE PROCEDURE ZOO.sp_removerBilheteira
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.LIMPA
                WHERE Recinto_ID = @id;

                DELETE FROM ZOO.BILHETEIRA
                WHERE Recinto_ID = @id;

                DELETE FROM ZOO.RECINTO 
                WHERE ID = @id;

            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover bilheteira! Algum dado está incorreto', 16, 1);
        end catch
    END
go 

--Procedure para adicionar restauracao
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarRestauracao;
go
CREATE PROCEDURE ZOO.sp_adicionarRestauracao
    @nome_jz varchar(30),
    @nome varchar(30),
    @estado varchar(10),
    @max_capacidade int
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @recinto_id int;

                SELECT @recinto_id = MAX(ID) + 1 FROM ZOO.RECINTO;

                INSERT INTO ZOO.RECINTO VALUES (@recinto_id, @nome_jz, @nome, @estado);
                INSERT INTO ZOO.RESTAURACAO VALUES (@recinto_id, @nome_jz, @max_capacidade);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar restaurante! Algum dado está incorreto', 16, 1);
        end catch
    END
go

--Procedure para remover restauracao
DROP PROCEDURE IF EXISTS ZOO.sp_removerRestauracao;
go
CREATE PROCEDURE ZOO.sp_removerRestauracao
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.RESTAURACAO
                WHERE Recinto_ID = @id;

                DELETE FROM ZOO.RECINTO 
                WHERE ID = @id;
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover restaurante! Algum dado está incorreto', 16, 1);
        end catch
    END
go


-- Procedure para adicionar um bilhete vendido
DROP PROCEDURE IF EXISTS ZOO.sp_adicionarBilhete;
go 
CREATE PROCEDURE ZOO.sp_adicionarBilhete
    @v_numero_cc int,
    @v_nome varchar(40),
    @v_genero character,
    @v_data_nascimento date,
    @preco decimal(10,2),
    @data_compra date,
    @f_numero_cc int,
    @nome_jz varchar(30),
    @bilheteira_id int
    
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @id int;

                SELECT @id = MAX(ID) + 1 FROM ZOO.BILHETE;
                if NOT EXISTS(SELECT * FROM ZOO.PESSOA WHERE Numero_CC = @v_numero_cc)
                BEGIN
                    INSERT INTO ZOO.PESSOA VALUES (@v_numero_cc, @v_nome, @v_genero, @v_data_nascimento);
                    INSERT INTO ZOO.VISITANTE VALUES (@v_numero_cc);
                END
                ELSE 
                BEGIN
                    IF NOT EXISTS (SELECT * FROM ZOO.VISITANTE WHERE Numero_CC = @v_numero_cc)
                    BEGIN
                        INSERT INTO ZOO.VISITANTE VALUES (@v_numero_cc);
                    END
                END

                INSERT INTO ZOO.BILHETE VALUES (@id, @preco, @data_compra, @v_numero_cc, @f_numero_cc, @nome_jz, @bilheteira_id);
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível adicionar bilhete! Algum dado está incorreto', 16, 1);
        end catch
    END
go

-- Procedure para remover bilhete    
DROP PROCEDURE IF EXISTS ZOO.sp_removerBilhete;
go
CREATE PROCEDURE ZOO.sp_removerBilhete
    @id int
AS
    BEGIN
        begin try
            begin transaction
                DELETE FROM ZOO.BILHETE
                WHERE ID = @id;
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível remover bilhete! Algum dado está incorreto', 16, 1);
        end catch
    END
go

-- transferencia de funcionarios --

-- transferencia de seguranca 
DROP PROCEDURE IF EXISTS ZOO.sp_transferirSeguranca;
go
CREATE PROCEDURE ZOO.sp_transferirSeguranca
    @f_numero_cc int,
    @recinto_id int
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @previous_nome_jz int;
                DECLARE @nome_jz int;
                DECLARE @gerente_id int;
                DECLARE @gerente_seg_numero int = NULL;

                --guardar antigo nome_jz
                SELECT @previous_nome_jz = Nome_JZ
                FROM ZOO.SEGURANCA
                WHERE F_Numero_CC = @f_numero_cc;

                --novo nome_jz
                SELECT @nome_jz = Nome_JZ
                FROM ZOO.RECINTO 
                WHERE ID=@recinto_id;

                IF @previous_nome_jz != @nome_jz
                BEGIN
                    IF (SELECT GerenteSeguranca_Numero FROM ZOO.SEGURANCA WHERE F_Numero_CC = @f_numero_cc) IS NULL
                    BEGIN
                        SELECT TOP 1 @gerente_seg_numero = F_Numero_CC
                        FROM ZOO.SEGURANCA JOIN ZOO.FUNCIONARIO ON ZOO.SEGURANCA.F_Numero_CC = ZOO.FUNCIONARIO.Numero_CC
                        WHERE F_Numero_CC != @f_numero_cc AND ZOO.SEGURANCA.Nome_JZ = @previous_nome_jz
                        ORDER BY Data_ingresso ASC;

                        UPDATE ZOO.SEGURANCA
                        SET GerenteSeguranca_Numero = @gerente_seg_numero
                        WHERE F_Numero_CC != @f_numero_cc AND Nome_JZ = @previous_nome_jz;

                        UPDATE ZOO.SEGURANCA
                        SET GerenteSeguranca_Numero = NULL
                        WHERE F_Numero_CC = @gerente_seg_numero;
                    END
                    --novo gerente de seguranca
                    SELECT @gerente_id = GerenteSeguranca_Numero
                    FROM ZOO.SEGURANCA
                    WHERE Nome_JZ = @nome_jz AND GerenteSeguranca_Numero IS NOT NULL;

                    UPDATE ZOO.SEGURANCA
                    SET GerenteSeguranca_Numero = @gerente_id, Recinto_ID = @recinto_id, Nome_JZ = @nome_jz
                    WHERE F_Numero_CC = @f_numero_cc;

                    UPDATE ZOO.FUNCIONARIO 
                    SET Nome_JZ = @nome_jz
                    WHERE Numero_CC = @f_numero_cc;
                END

                UPDATE ZOO.SEGURANCA
                SET Recinto_ID = @recinto_id
                WHERE F_Numero_CC = @f_numero_cc;

            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível transferir segurança! Algum dado está incorreto', 16, 1);
        end catch
    END
go 

-- transferencia de veterinario
DROP PROCEDURE IF EXISTS ZOO.sp_transferirVeterinario
go
CREATE PROCEDURE ZOO.sp_transferirVeterinario
    @f_numero_cc int,
    @nome_jz varchar(30)
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @previous_nome_jz int;
                DECLARE @gerente_id int;
                DECLARE @gerente_vet_numero int = NULL;

                --guardar antigo nome_jz
                SELECT @previous_nome_jz = Nome_JZ
                FROM ZOO.VETERINARIO JOIN ZOO.FUNCIONARIO ON F_Numero_CC = Numero_CC
                WHERE F_Numero_CC = @f_numero_cc;

                IF @previous_nome_jz != @nome_jz
                BEGIN
                    IF (SELECT GerenteVet_Numero FROM ZOO.VETERINARIO WHERE F_Numero_CC = @f_numero_cc) IS NULL
                    BEGIN
                        SELECT TOP 1 @gerente_vet_numero = F_Numero_CC
                        FROM ZOO.VETERINARIO JOIN ZOO.FUNCIONARIO ON ZOO.VETERINARIO.F_Numero_CC = ZOO.FUNCIONARIO.Numero_CC
                        WHERE F_Numero_CC != @f_numero_cc AND ZOO.FUNCIONARIO.Nome_JZ = @previous_nome_jz
                        ORDER BY Data_ingresso ASC;

                        UPDATE ZOO.VETERINARIO
                        SET GerenteVet_Numero = @gerente_vet_numero
                        FROM ZOO.VETERINARIO AS v
                        JOIN ZOO.FUNCIONARIO AS f ON v.F_Numero_CC = f.Numero_CC
                        WHERE v.F_Numero_CC != @f_numero_cc AND f.Nome_JZ = @previous_nome_jz;

                        UPDATE ZOO.VETERINARIO
                        SET GerenteVet_Numero = NULL
                        WHERE F_Numero_CC = @gerente_vet_numero;

                    END
                    ELSE 
                    BEGIN
                        SELECT @gerente_vet_numero = GerenteVet_Numero
                        FROM ZOO.VETERINARIO JOIN ZOO.FUNCIONARIO ON F_Numero_CC = Numero_CC
                        WHERE  GerenteVet_Numero IS NOT NULL AND Nome_JZ = @nome_jz;
                    END

                    UPDATE ZOO.ANIMAL
                    SET Veterinario_CC = @gerente_vet_numero
                    WHERE veterinario_CC = @f_numero_cc;
                END

                UPDATE ZOO.FUNCIONARIO
                SET Nome_JZ = @nome_jz
                FROM ZOO.VETERINARIO AS v
                JOIN ZOO.FUNCIONARIO AS f ON v.F_Numero_CC = f.Numero_CC
                WHERE v.F_Numero_CC = @f_numero_cc;

            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível transferir veterinário! Algum dado está incorreto', 16, 1);
        end catch
    END
go

-- transferencia de tratador
DROP PROCEDURE IF EXISTS ZOO.sp_transferirTratador
go
CREATE PROCEDURE ZOO.sp_transferirTratador
    @f_numero_cc int,
    @habitat_id varchar(30)
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @previous_nome_jz varchar(30);
                DECLARE @gerente_trat_numero int = NULL;
                DECLARE @new_nome_jz varchar(30);

                --guardar antigo nome_jz
                SELECT @previous_nome_jz = Nome_JZ
                FROM ZOO.FUNCIONARIO 
                WHERE Numero_CC = @f_numero_cc;

                --novo nome_jz
                SELECT @new_nome_jz = Nome_JZ
                FROM ZOO.HABITAT 
                WHERE Recinto_ID=@habitat_id;

                IF @previous_nome_jz != @new_nome_jz
                BEGIN
                    IF (SELECT GerenteTratador_Numero FROM ZOO.TRATADOR WHERE F_Numero_CC = @f_numero_cc) IS NULL
                    BEGIN
                        SELECT TOP 1 @gerente_trat_numero = F_Numero_CC
                        FROM ZOO.TRATADOR JOIN ZOO.FUNCIONARIO ON ZOO.TRATADOR.F_Numero_CC = ZOO.FUNCIONARIO.Numero_CC
                        WHERE F_Numero_CC != @f_numero_cc AND Nome_JZ = @previous_nome_jz
                        ORDER BY Data_ingresso ASC;

                        UPDATE t
                        SET GerenteTratador_Numero = @gerente_trat_numero
                        FROM ZOO.TRATADOR AS t
                        JOIN ZOO.FUNCIONARIO AS f ON t.F_Numero_CC = f.Numero_CC
                        WHERE t.F_Numero_CC != @f_numero_cc AND f.Nome_JZ = @previous_nome_jz;

                        UPDATE ZOO.TRATADOR
                        SET GerenteTratador_Numero = NULL
                        WHERE F_Numero_CC = @gerente_trat_numero;
                    END

                DELETE ZOO.RESPONSAVEL_POR
                WHERE T_Numero_CC = @f_numero_cc;

                END 
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível transferir tratador! Algum dado está incorreto', 16, 1);
        end catch
    END
go


-- Procedure para transferir um funcionario de bilheteira
DROP PROCEDURE IF EXISTS ZOO.sp_transferirFuncionarioBilheteira;
go 
CREATE PROCEDURE ZOO.sp_transferirFuncionarioBilheteira
    @f_numero_cc int,
    @recinto_id int
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @previous_nome_jz int;
                DECLARE @nome_jz int;

                --guardar antigo nome_jz
                SELECT @previous_nome_jz = Nome_JZ
                FROM ZOO.FUNCIONARIO
                WHERE Numero_CC = @f_numero_cc;

                --novo nome_jz
                SELECT @nome_jz = Nome_JZ
                FROM ZOO.RECINTO 
                WHERE ID=@recinto_id;

                IF @previous_nome_jz != @nome_jz
                BEGIN
                    UPDATE ZOO.FUNCIONARIO_BILHETEIRA
                    SET Nome_JZ = @nome_jz, Bilheteira_ID = @recinto_id
                    WHERE F_Numero_CC = @f_numero_cc;

                    UPDATE ZOO.FUNCIONARIO
                    SET Nome_JZ = @nome_jz
                    WHERE Numero_CC = @f_numero_cc;
                END
                ELSE
                BEGIN
                    UPDATE ZOO.FUNCIONARIO_BILHETEIRA
                    SET Bilheteira_ID = @recinto_id
                    WHERE F_Numero_CC = @f_numero_cc;
                END
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível transferir funcionário de bilheteira! Algum dado está incorreto', 16, 1);
        end catch
    END
go

-- Procedure para transferir um trabalhador de restauracao
DROP PROCEDURE IF EXISTS ZOO.sp_transferirTrabalhadorRestauracao;
go
CREATE PROCEDURE ZOO.sp_transferirTrabalhadorRestauracao
    @f_numero_cc int,
    @recinto_id int
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @previous_nome_jz int;
                DECLARE @nome_jz int;

                --guardar antigo nome_jz
                SELECT @previous_nome_jz = Nome_JZ
                FROM ZOO.FUNCIONARIO
                WHERE Numero_CC = @f_numero_cc;

                --novo nome_jz
                SELECT @nome_jz = Nome_JZ
                FROM ZOO.RECINTO 
                WHERE ID=@recinto_id;

                IF @previous_nome_jz != @nome_jz
                BEGIN
                    UPDATE ZOO.TRABALHADOR_RESTAURACAO
                    SET Nome_JZ = @nome_jz, Restauracao_ID = @recinto_id
                    WHERE F_Numero_CC = @f_numero_cc;

                    UPDATE ZOO.FUNCIONARIO
                    SET Nome_JZ = @nome_jz
                    WHERE Numero_CC = @f_numero_cc;
                END
                ELSE
                BEGIN
                    UPDATE ZOO.TRABALHADOR_RESTAURACAO
                    SET Restauracao_ID = @recinto_id
                    WHERE F_Numero_CC = @f_numero_cc;
                END
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível transferir trabalhador de restauração! Algum dado está incorreto', 16, 1);
        end catch
    END
go 

-- Procedure para transferir um funcionario de limpeza
DROP PROCEDURE IF EXISTS ZOO.sp_transferirFuncionarioLimpeza;
go
CREATE PROCEDURE ZOO.sp_transferirFuncionarioLimpeza
    @f_numero_cc int,
    @new_nome_jz varchar(30)
AS
    BEGIN
        begin try
            begin transaction
                DECLARE @previous_nome_jz varchar(30);

                --guardar antigo nome_jz
                SELECT @previous_nome_jz = Nome_JZ
                FROM ZOO.FUNCIONARIO
                WHERE Numero_CC = @f_numero_cc;

                IF @previous_nome_jz != @new_nome_jz
                BEGIN
                    UPDATE ZOO.FUNCIONARIO
                    SET Nome_JZ = @new_nome_jz
                    WHERE Numero_CC = @f_numero_cc;

                    DELETE ZOO.LIMPA
                    WHERE FL_Numero_CC = @f_numero_cc;
                END
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível transferir funcionário de limpeza! Algum dado está incorreto', 16, 1);
        end catch
    END
go


-- Procedure para alterar contrato de um funcionario
DROP PROCEDURE IF EXISTS ZOO.sp_alterarContrato;
go
CREATE PROCEDURE ZOO.sp_alterarContrato
    @f_numero_cc int,
    @tipo_contrato char(9),
    @salario decimal(10,2),
    @data_inicio_contrato date,
    @data_fim_contrato date
AS
    BEGIN
        begin try
            begin transaction
                UPDATE ZOO.CONTRATO
                SET Tipo_contrato = @tipo_contrato, Salario = @salario, Data_inicio_contrato = @data_inicio_contrato, Data_fim_contrato = @data_fim_contrato
                WHERE F_Numero_CC = @f_numero_cc;
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível alterar contrato! Algum dado está incorreto', 16, 1);
        end catch
    END
go


--Procedure para alterar recinto
DROP PROCEDURE IF EXISTS ZOO.sp_editarRecinto;
GO
CREATE PROCEDURE ZOO.sp_editarRecinto
    @ID INT,
    @Nome NVARCHAR(50),
    @Estado NVARCHAR(50)
AS
    BEGIN
        begin try
            begin transaction
                IF EXISTS (SELECT * FROM ZOO.RECINTO WHERE ID = @ID)
                BEGIN
                    UPDATE ZOO.RECINTO SET Nome = @Nome, Estado = @Estado WHERE ID = @ID;
                END
                ELSE
                BEGIN
                    RAISERROR('Recinto não existe!', 16, 1);
                END
            commit transaction
        end try
        begin catch
            rollback transaction
            RAISERROR('Impossível editar recinto! Algum dado está incorreto', 16, 1);
        end catch
    END
GO

--Procedure para eliminar funcionário
DROP Procedure IF EXISTS ZOO.sp_eliminarFuncionario;
GO
CREATE PROCEDURE ZOO.sp_eliminarFuncionario (
    @Numero_CC INT
)
AS
BEGIN
    BEGIN TRANSACTION;
        BEGIN TRY
            DECLARE @count INT;
            SELECT @count = COUNT(*) FROM ZOO.SEGURANCA WHERE F_Numero_CC = @Numero_CC;
            IF  @count > 0
            BEGIN
                EXEC ZOO.sp_removerSeguranca @Numero_CC;
            END
            
            SELECT @count = COUNT(*) FROM ZOO.TRATADOR WHERE F_Numero_CC = @Numero_CC;
            IF @count > 0
            BEGIN
                EXEC ZOO.sp_removerTratador @Numero_CC;
            END

            SELECT @count = COUNT(*) FROM ZOO.VETERINARIO WHERE F_Numero_CC = @Numero_CC;
            IF @count > 0
            BEGIN
                EXEC ZOO.sp_removerVeterinario @Numero_CC;
            END

            SELECT @count = COUNT(*) FROM ZOO.FUNCIONARIO_BILHETEIRA WHERE F_Numero_CC = @Numero_CC;
            IF @count > 0
            BEGIN
                EXEC ZOO.sp_removerFuncionarioBilheteira @Numero_CC;
            END

            SELECT @count = COUNT(*) FROM ZOO.FUNCIONARIO_LIMPEZA WHERE F_Numero_CC = @Numero_CC;
            IF @count > 0
            BEGIN
                EXEC ZOO.sp_removerFuncionarioLimpeza @Numero_CC;
            END

            SELECT @count = COUNT(*) FROM ZOO.TRABALHADOR_RESTAURACAO WHERE F_Numero_CC = @Numero_CC;
            IF @count > 0
            BEGIN
                EXEC ZOO.sp_removerTrabalhadorRestauracao @Numero_CC;
            END
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION;
            THROW;
        END CATCH
    COMMIT TRANSACTION;
END
GO


-- Procedure para editar funcionário
DROP PROCEDURE IF EXISTS ZOO.sp_editarFuncionario;
GO
CREATE PROCEDURE ZOO.sp_editarFuncionario (
    @Numero_CC INT,
    @Nome NVARCHAR(50),
    @Genero CHAR(1),
    @Data_nascimento DATE,
    @Data_ingresso DATE,
    @Tipo_contrato CHAR(9),
    @Salario DECIMAL(10, 2),
    @Data_inicio_contrato DATE,
    @Data_fim_contrato DATE,
    @Supervisor_CC INT = NULL
)
AS
BEGIN
    BEGIN TRANSACTION;
        BEGIN TRY
            UPDATE ZOO.PESSOA SET
                Nome = @Nome,
                Genero = @Genero,
                Data_nascimento = @Data_nascimento
            WHERE Numero_CC = @Numero_CC;

            UPDATE ZOO.FUNCIONARIO SET
                Data_ingresso = @Data_ingresso
            WHERE Numero_CC = @Numero_CC;
            IF @Supervisor_CC IS NOT NULL
            BEGIN
            DECLARE @count INT;
                SELECT @count = COUNT(*) FROM ZOO.SEGURANCA WHERE F_Numero_CC = @Numero_CC;
                PRINT @count;
                IF  @count > 0 
                BEGIN
                    EXEC ZOO.sp_definirSegurancaComoGerente @Supervisor_CC;
                END

                SELECT @count = COUNT(*) FROM ZOO.TRATADOR WHERE F_Numero_CC = @Numero_CC;
                PRINT @count;
                IF @count > 0
                BEGIN
                    EXEC ZOO.sp_definirTratadorComoGerente @Supervisor_CC;
                END

                SELECT @count = COUNT(*) FROM ZOO.VETERINARIO WHERE F_Numero_CC = @Numero_CC;
                PRINT @count;
                IF @count > 0
                BEGIN
                    EXEC ZOO.sp_definirVeterinarioComoGerente @Supervisor_CC;
                END                
            END

            EXEC ZOO.sp_alterarContrato @Numero_CC, @Tipo_contrato, @Salario, @Data_inicio_contrato, @Data_fim_contrato;

        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION;
            THROW;
        END CATCH;
    COMMIT TRANSACTION;
END;
GO; 