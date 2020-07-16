CREATE TABLE transacional.temp_liquidacao_saldo_conta_cred as
select cpag.id_conta , sacc.saldo_fatura_atual
from  cadastral.conta_pagamento cpag
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
       and sacc.id_saldo_conta_cred  in(select max(sacc2.id_saldo_conta_cred) from transacional.saldo_conta_cred sacc2 where sacc.id_conta = sacc2.id_conta );
       
CREATE INDEX idx_transacao_apresentada_liquidacao_id_conta
ON transacional.temp_liquidacao_transacao_apresentada(id_conta);

/*

create table cadastral.jcard_bahamas_liquidacao(
id_conta text,
saldo text;


alter table cadastral.jcard_bahamas_liquidacao alter column id_conta TYPE numeric  USING (id_conta::numeric);

select * from cadastral.jcard_bahamas_liquidacao where id_conta = 137523
*/
