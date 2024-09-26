CREATE TRIGGER trg_check_remover_habitaculo
ON ZOO.HABITACULO
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @Habitaculo_id int, @Nome_JZ varchar(30);

    -- Seleciona os valores de ID e Nome_JZ da tentativa de exclusão
    SELECT @Habitaculo_id = DELETED.ID, @Nome_JZ = DELETED.Nome_JZ
    FROM DELETED;

    -- Verifica se há animais associados ao habitaculo que está a ser excluído
    IF EXISTS (
        SELECT 1
        FROM ZOO.ANIMAL
        WHERE ZOO.ANIMAL.Habitaculo_ID = @Habitaculo_id
    )
    BEGIN
        RAISERROR('Não é possível remover o habitáculo porque há animais associados a ele.', 16, 1);
    END
    ELSE
    BEGIN
        -- Se não houver funcionários associados, permite a exclusão
        DELETE FROM ZOO.HABITACULO
        WHERE ID = @Habitaculo_id AND Nome_JZ = @Nome_JZ;
    END
END;