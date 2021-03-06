select 
coalesce (pess.documento,'')||'#'||
coalesce (to_char (cpaf.dt_vencimento_atual,'DDMMYYYY'), '') ||'#'||
coalesce (to_char (cpaf.dt_vencimento_atual,'DDMMYYYY'), '') ||'#'||
trim(coalesce (to_char(cpag.qtd_dias_atraso,'9999'),'')) ||'#'||
coalesce (to_char (escc.dt_hr_entrada,'DDMMYYYY'), '') ||'#'||
coalesce (to_char (escc.dt_hr_saida,'DDMMYYYY'), '') ||'#'||
''||'#'||
trim(coalesce (to_char(100*(coalesce(jcard_temp.saldo,0) + coalesce(tapr.parcela_futura,0)) ,'9999999999'),''))||'#'||
trim(coalesce (to_char(cast(picc.qt_dias_to_perda as integer) + cpaf.dt_vencimento_atual, 'DDMMYYYY'),''))||'#'||
''||'#'
from cadastral.conta_pagamento cpag
inner join cadastral.temp_conta_pagamento_fat cpaf  on cpaf.id_conta = cpag.id_conta 
inner join cadastral.jcard_bahamas_liquidacao jcard_temp on jcard_temp.id_conta = cpag.id_conta
left  join transacional.temp_liquidacao_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
inner join cadastral.temp_produto_instituicao_config_credito picc on picc.id_conta = cpag.id_conta
inner join cadastral.temp_2_escritorio_cobranca_conta escc on escc.id_conta = cpag.id_conta
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta
inner join cadastral.pessoa pess on cpes.id_pessoa = pess.id_pessoa
where  cpag.id_instituicao = 1201 and  cpag.id_status_conta IN (68,70);
