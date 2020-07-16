-- INICIO 71.126
select COUNT(*)
from cadastral.conta_pagamento     cpag
inner join cadastral.conta_pagamento_fat cpaf  on cpaf.id_conta = cpag.id_conta 
where  cpag.id_instituicao = 1201
        and  cpag.id_status_conta IN (68,70)
-- FIM

-- INICIO TEMP 002 - 19080 
select cpag.id_conta , sum((tapr.parcela_qtd-tapr.parcela_nro_parcela) * tapr.valor_moeda_liquidacao)	
from   cadastral.conta_pagamento cpag
inner join transacional.transacao_apresentada tapr on tapr.id_conta = cpag.id_conta 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
group by cpag.id_conta;
-- FIM TEMP 002

-- INICIO TEMP 003 - 71.071
select cpag.id_conta , sacc.saldo_fatura_atual
from  cadastral.conta_pagamento cpag
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
       and sacc.id_saldo_conta_cred  in(select max(sacc2.id_saldo_conta_cred) from transacional.saldo_conta_cred sacc2 where sacc.id_conta = sacc2.id_conta );       
-- FIM TEMP 003

-- INICIO TEMP 003 DISTINCT - 71.071
 select COUNT(distinct (ID_CONTA)) from transacional.temp_liquidacao_saldo_conta_cred ;
-- FIM TEMP 003

-- INICIO TEMP 004 71.071
select count(*)--cpag.id_conta , picc.qt_dias_to_perda
from  cadastral.conta_pagamento cpag
inner join  cadastral.produto_instituicao_config_credito picc on picc.id_instituicao  = cpag.id_instituicao 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
       and picc.id  in(select max(picc2.id) from cadastral.produto_instituicao_config_credito picc2  where picc2.id_instituicao  = cpag.id_instituicao);
-- FIM   

-- INICIO TEMP 005 TEMP - 71.071 
select cpag.id_conta , max(cpaf.dt_vencimento_atual)	
from   cadastral.conta_pagamento cpag
inner join cadastral.conta_pagamento_fat cpaf on cpaf.id_conta = cpag.id_conta 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
group by cpag.id_conta;
-- FIM


------------------------------------------AJUSTANDO JOIN------------------------------------------------

--INICIO 77.707
select COUNT(*)
from cadastral.conta_pagamento     cpag
inner join cadastral.temp_conta_pagamento_fat cpaf  on cpaf.id_conta = cpag.id_conta 
inner join transacional.temp_liquidacao_saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta
left  join transacional.temp_liquidacao_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
inner join cadastral.temp_produto_instituicao_config_credito picc on picc.id_conta = cpag.id_conta
inner join cadastral.escritorio_cobranca_conta escc on escc.id_conta = cpag.id_conta
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta
inner join cadastral.pessoa pess on cpes.id_pessoa = pess.id_pessoa
where  cpag.id_instituicao = 1201 and  cpag.id_status_conta IN (68,70)
--FIM

-- INICIO 73.908
select COUNT(*)
from cadastral.conta_pagamento     cpag
inner join cadastral.escritorio_cobranca_conta escc on escc.id_conta = cpag.id_conta
where  cpag.id_instituicao = 1201 and  cpag.id_status_conta IN (68,70)
--FIM

-- INICIO 
select COUNT(*)
from cadastral.conta_pagamento     cpag
inner join cadastral.escritorio_cobranca_conta escc on escc.id_conta = cpag.id_conta
where  cpag.id_instituicao = 1201 and  cpag.id_status_conta IN (68,70)
and escc.id in (select max (escc2.id) from cadastral.escritorio_cobranca_conta escc2 where escc2.id_conta = escc.id_conta);
-- FIM 

--INICIO 75.165
select COUNT(*)
from cadastral.conta_pagamento     cpag
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta
inner join cadastral.pessoa pess on cpes.id_pessoa = pess.id_pessoa
where  cpag.id_instituicao = 1201 and  cpag.id_status_conta IN (68,70)
--FIM

-- INICIO 123.373 : REMOVER DO ESCOPO
select COUNT(*)
from cadastral.conta_pagamento     cpag
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta
inner join cadastral.pessoa pess on cpes.id_pessoa = pess.id_pessoa
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
where  cpag.id_instituicao = 1201 and  cpag.id_status_conta IN (68,70)
and cred.titularidade = 1 
-- FIM

-- INICIO 74.104 
select 
count(*)
from cadastral.conta_pagamento cpag
inner join cadastral.temp_conta_pagamento_fat cpaf  on cpaf.id_conta = cpag.id_conta 
inner join transacional.temp_liquidacao_saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta
left  join transacional.temp_liquidacao_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
inner join cadastral.temp_produto_instituicao_config_credito picc on picc.id_conta = cpag.id_conta
inner join cadastral.temp_2_escritorio_cobranca_conta escc on escc.id_conta = cpag.id_conta
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta
inner join cadastral.pessoa pess on cpes.id_pessoa = pess.id_pessoa
where  cpag.id_instituicao = 1201 and  cpag.id_status_conta IN (68,70);
-- FIM

-- INICIO 74.056

-- FIM
