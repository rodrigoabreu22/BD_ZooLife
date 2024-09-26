CREATE TRIGGER trg_validar_datas_contrato
ON ZOO.CONTRATO
INSTEAD OF INSERT
AS BEGIN 
    DECLARE @Data_Inicio date, @Data_Fim date;
    SELECT @Data_Inicio = INSERTED.Data_inicio_contrato, @Data_Fim = INSERTED.Data_fim_contrato
    FROM INSERTED;

    IF @Data_Inicio > @Data_Fim
    BEGIN
        RAISERROR('Data de início do contrato não pode ser posterior à data de fim.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO ZOO.CONTRATO (F_Numero_CC, Tipo_contrato, Salario, Data_inicio_contrato, Data_fim_contrato)
        SELECT F_Numero_CC, Tipo_contrato, Salario, Data_inicio_contrato, Data_fim_contrato
        FROM INSERTED;
    END
END;