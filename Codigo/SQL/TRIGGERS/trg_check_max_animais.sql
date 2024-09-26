-- Trigger para evitar que o limite de animais num habitaculo seja excedido
CREATE TRIGGER trg_check_max_animais
ON ZOO.ANIMAL
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Habitaculo_ID int, @Habitat_ID int, @Nome_JZ varchar(30);

    SELECT @Habitaculo_ID = INSERTED.Habitaculo_ID,
           @Habitat_ID = INSERTED.Habitat_ID,
           @Nome_JZ = INSERTED.Nome_JZ
    FROM INSERTED;

    IF @Habitaculo_ID IS NOT NULL AND @Habitat_ID IS NOT NULL AND @Nome_JZ IS NOT NULL
    BEGIN
        DECLARE @CurrentCount int, @MaxAnimals int;

        SELECT @CurrentCount = COUNT(*)
        FROM ZOO.ANIMAL
        WHERE Habitaculo_ID = @Habitaculo_ID AND Habitat_ID = @Habitat_ID AND Nome_JZ = @Nome_JZ;

        SELECT @MaxAnimals = Max_animais
        FROM ZOO.HABITACULO
        WHERE ID = @Habitaculo_ID AND Habitat_ID = @Habitat_ID AND Nome_JZ = @Nome_JZ;

        IF @CurrentCount > @MaxAnimals
        BEGIN
            RAISERROR ('Número máximo de animais no habitáculo excedido.', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END
END;
