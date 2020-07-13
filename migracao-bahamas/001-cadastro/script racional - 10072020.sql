
--inicio 192.345
select      count(*.)
from        cadastral.conta_pagamento cpag
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
--fim

--inicio 152.041
select      count(*.)
from        cadastral.conta_pagamento cpag
inner join cadastral.conta_pagamento_fat cpaf on cpaf.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
--fim

--inicio 313.949
select      count(*.)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
-- fim

--inicio 313.917
select      count(*.)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta    
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
--fim

--inicio 313.917
select      count(*.)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
--fim

--inicio 9.278.043
select      count(*.)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.transacao_apresentada tapr on tapr.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
--fim

--inicio 8.752.053 neste ponto, não considera a utilização da tabela transacao_apresentada
select      count(*.)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
--fim

--inicio 270.381
select      count(*.)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
--fim

--inicio 295.599 titular ; 642 dependente = total 296.241
select      count(*), cred.titularidade
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
group by  cred.titularidade
--fim

--inicio 273.201 titular ; 549 dependente = total 273.750
select      count(*.) , cred.titularidade
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
group by cred.titularidade
--fim

--inicio 275.338
select      count(*.) , cred.titularidade
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
left JOIN suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
group by cred.titularidade
--fim

--inicio 5.351
select      count(*.) , cred.titularidade
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
inner JOIN suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
group by cred.titularidade
--fim

--inicio 1.699.082 TABELA TEMP DE TRANSACAO
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
left JOIN suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
inner join transacional.temp_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
--fim

--inicio 1.699.082 TABELA TEMP DE TRANSACAO ANTIGA
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
left JOIN suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
inner join transacional.temp_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
inner join cadastral.conta_pagamento_fat cpaf on cpaf.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
--fim

--inicio 138.214 TABELA TEMP DE TRANSACAO NOVA
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
left JOIN suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
inner join transacional.temp_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
inner join cadastral.conta_pagamento_fat cpaf on cpaf.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
--fim
