CREATE TRIGGER trg_check_remover_habitat
ON ZOO.HABITAT
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @Recinto_ID int, @Nome_JZ varchar(30);

    -- Seleciona os valores de ID e Nome_JZ da tentativa de exclusão
    SELECT @Recinto_ID = DELETED.Recinto_ID, @Nome_JZ = DELETED.Nome_JZ
    FROM DELETED;

    -- Verifica se há funcionários associados ao recinto que está sendo excluído
    IF EXISTS (
        SELECT 1
        FROM ZOO.RESPONSAVEL_POR
        WHERE Habitat_ID = @Recinto_ID
    )
    OR EXISTS (
        SELECT 1
        FROM ZOO.HABITACULO
        WHERE Habitat_ID = @Recinto_ID AND Nome_JZ = @Nome_JZ
    )
    BEGIN
        RAISERROR('Não é possível remover o recinto porque há funcionários ou habitáculos associados a ele.', 16, 1);
    END
    ELSE
    BEGIN
        -- Se não houver funcionários associados, permite a exclusão
        DELETE FROM ZOO.HABITAT
        WHERE Recinto_ID = @Recinto_ID AND Nome_JZ = @Nome_JZ;
    END
END;