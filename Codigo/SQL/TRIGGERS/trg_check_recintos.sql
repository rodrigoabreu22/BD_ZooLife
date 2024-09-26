CREATE TRIGGER trg_check_recinto_nome_unico
ON ZOO.RECINTO
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @Nome_JZ varchar(30), @Nome varchar(30);

    -- Seleciona os valores de Nome_JZ e Nome da tentativa de inserção
    SELECT @Nome_JZ = INSERTED.Nome_JZ, @Nome = INSERTED.Nome
    FROM INSERTED;

    -- Verifica se já existe um recinto com o mesmo nome no mesmo jardim zoológico
    IF EXISTS (
        SELECT 1 
        FROM ZOO.RECINTO
        WHERE Nome_JZ = @Nome_JZ AND Nome = @Nome
    )
    BEGIN
        RAISERROR('Já existe um recinto com este nome neste jardim zoológico.', 16, 1);
    END
    ELSE
    BEGIN
        -- Se não houver conflito, permite a inserção
        INSERT INTO ZOO.RECINTO (ID, Nome_JZ, Nome, Estado)
        SELECT ID, Nome_JZ, Nome, Estado
        FROM INSERTED;
    END
END;