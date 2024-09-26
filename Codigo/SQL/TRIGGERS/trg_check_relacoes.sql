CREATE TRIGGER trg_check_relacoes
ON ZOO.ANIMAL_RELACIONADO
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @Animal1_ID int, @Animal2_ID int, @Nome1 varchar(30), @Nome2 varchar(30);

    -- Seleciona os IDs dos animais da tentativa de inserção
    SELECT @Animal1_ID = INSERTED.Animal1_ID,
           @Animal2_ID = INSERTED.Animal2_ID
    FROM INSERTED;

    -- Seleciona os nomes dos animais correspondentes aos IDs
    SELECT @Nome1 = AN1.Nome, @Nome2 = AN2.Nome
    FROM ZOO.ANIMAL AN1, ZOO.ANIMAL AN2
    WHERE AN1.ID = @Animal1_ID AND AN2.ID = @Animal2_ID;

    -- Verifica se os nomes são diferentes
    IF @Nome1 <> @Nome2
    BEGIN
        RAISERROR('Animais com nomes diferentes não podem ter relações.', 16, 1);
    END
    ELSE
    BEGIN
        -- Se os nomes forem iguais, permite a inserção
        INSERT INTO ZOO.ANIMAL_RELACIONADO (Animal1_ID, Animal2_ID, Relacao)
        SELECT Animal1_ID, Animal2_ID, Relacao
        FROM INSERTED;
    END
END;