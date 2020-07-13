CREATE TABLE transacional.temp_saldo_conta_cred AS
select sac2.id_conta, max(sac2.ano_mes_fat) ano_mes_fat
from transacional.saldo_conta_cred sac2 
INNER JOIN cadastral.credencial cred ON cred.id_conta = sac2.id_conta
inner join cadastral.conta_pagamento cpag on cpag.id_conta = sac2.id_conta 
WHERE cpag.id_instituicao =1201
and cred.titularidade IN (0,1)
and cpag.id_status_conta not in (63,64)
group by  sac2.id_conta;

CREATE INDEX idx_temp_saldo_conta_cred_id_conta
ON transacional.temp_saldo_conta_cred(id_conta);




