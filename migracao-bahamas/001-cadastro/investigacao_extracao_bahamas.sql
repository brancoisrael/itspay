
-- INVESTIGANDO CASOS DE DUPLICIDADE!
-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058);         

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058) ;        

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058);         

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058);         

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join  transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058);         

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join  transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join  transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat = sacc_temp.ano_mes_fat
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058) ;        

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join  transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join  transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join  cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058) ;        

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join  transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join  transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join  cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join  cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058) ;        

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join  transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join  transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join  cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join  cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join  cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058)    ;     

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join  transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join  transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join  cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join  cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join  cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
left JOIN   suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058)  ;       

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join  transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join  transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join  cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join  cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join  cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
left JOIN   suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
inner join  transacional.temp_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058)     ;    

-- COUNT
select      count(*)
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join  suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join  cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join  transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
inner join  transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join  cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta 
inner join  cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join  cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
left JOIN   suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
inner join  transacional.temp_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
inner join  cadastral.conta_pagamento_fat cpaf on cpaf.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cpag.id_conta in (232756, 233058)      ;   
