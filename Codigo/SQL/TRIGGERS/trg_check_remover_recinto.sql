CREATE TRIGGER trg_check_recinto_sem_funcionarios
ON ZOO.RECINTO
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @ID int, @Nome_JZ varchar(30);
    -- Seleciona os valores de ID e Nome_JZ da tentativa de exclusão
    SELECT @ID = DELETED.ID, @Nome_JZ = DELETED.Nome_JZ
    FROM DELETED;
    -- Verifica se há funcionários associados ao recinto que está sendo excluído
    IF EXISTS 
    (SELECT 1 FROM ZOO.HABITAT WHERE Recinto_ID = @ID )
    OR EXISTS 
    (SELECT 1 FROM ZOO.BILHETEIRA WHERE Recinto_ID = @ID)
    OR EXISTS 
    ( SELECT 1 FROM ZOO.RESTAURACAO WHERE Recinto_ID = @ID)
    BEGIN
        RAISERROR('Não é possível remover o recinto. Existe um recinto especifico associado.', 16, 1);
    END
    ELSE
    BEGIN
        -- Se não houver funcionários associados, permite a exclusão
        DELETE FROM ZOO.RECINTO
        WHERE ID = @ID AND Nome_JZ = @Nome_JZ;
    END
END;