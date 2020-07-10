CREATE TABLE transacional.temp_transacao_apresentada AS
select 		cpag.id_conta ,SUM((tapr.parcela_qtd-tapr.parcela_nro_parcela) * tapr.valor_moeda_liquidacao *100) as parcela_futura
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join transacional.transacao_apresentada tapr on tapr.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
group by cpag.id_conta
CREATE INDEX idx_transacao_apresentada_id_conta
ON cadastral.transacao_apresentada(id_conta);



