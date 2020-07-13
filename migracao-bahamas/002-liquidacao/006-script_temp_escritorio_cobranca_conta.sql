CREATE TABLE cadastral.temp_escritorio_cobranca_conta AS
select cpag.id_conta, escc.dt_hr_entrada, escc.dt_hr_saida
from cadastral.conta_pagamento cpag
inner join cadastral.escritorio_cobranca_conta escc on escc.id_conta = cpag.id_conta
where cpag.id_instituicao = 1201 and cpag.id_status_conta IN (68,70)
and escc.id in (select max (escc2.id) from cadastral.escritorio_cobranca_conta escc2 where escc2.id_conta = escc.id_conta);
  
CREATE INDEX idx_temp_escritorio_cobranca_conta_id_conta
ON cadastral.temp_escritorio_cobranca_conta(id_conta);
