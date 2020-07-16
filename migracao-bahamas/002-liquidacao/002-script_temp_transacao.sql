CREATE TABLE transacional.temp_liquidacao_transacao_apresentada AS
select cpag.id_conta , sum((tapr.parcela_qtd-tapr.parcela_nro_parcela) * tapr.valor_moeda_liquidacao) parcela_futura	
from cadastral.conta_pagamento cpag
inner join transacional.transacao_apresentada tapr on tapr.id_conta = cpag.id_conta 
where  cpag.id_instituicao = 1201  and  cpag.id_status_conta IN (68,70)
group by cpag.id_conta;
  
CREATE INDEX idx_transacao_apresentada_liquidacao_id_conta
ON transacional.temp_liquidacao_transacao_apresentada(id_conta);


/*
select cpag.id_conta, sum((tapr.parcela_qtd-coalesce (tapr.parcela_nro_parcela,0)) * tapr.valor_moeda_liquidacao) parcela_futura
from cadastral.conta_pagamento cpag
inner join transacional.transacao_apresentada tapr on tapr.id_conta = cpag.id_conta 
group by cpag.id_conta;
*/
