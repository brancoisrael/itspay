--Cadastro

select 
           trim(coalesce (to_char(cpes.id_conta,'99999999'),''))                                                   ||'#'||
           coalesce  (prin.desc_prod_instituicao,''       )                                                        ||'#'||
           trim(coalesce (to_char(prin.id                  ,'99999999'),''))                                       ||'#'||
	       coalesce  (pess.matricula           ,''        )                                                        ||'#'||
	       CASE WHEN pess.nome_completo IS NULL THEN 	'SEM NOME'
		   ELSE coalesce  (pess.nome_completo       ,''        )
		   end												                                                        ||'#'||
	       coalesce  (pess.nome_embossado      ,''        )                                                        ||'#'||
	       coalesce  (pess.documento           ,''        )                                                        ||'#'||
	       coalesce  (pess.rg                  ,''        )                                                        ||'#'||
	       coalesce  (pess.rg_orgao_emissor    ,''        )                                                        ||'#'||
	       coalesce (to_char   (pess.data_nascimento     ,'DDMMYYYY'),'')                                          ||'#'||
	       trim(coalesce (to_char(pess.id_sexo          ,'9'),''))                                                 ||'#'|| 
	       trim(coalesce (to_char(pess.id_estado_civil  ,'9'),''))                                                 ||'#'|| 
	       trim(coalesce (to_char(rapf.natureza_profissional,'999'),''))                                           ||'#'||
	       coalesce  (rapf.profissao,''       )                                                                    ||'#'||
           ''                                                                                                      ||'#'||  
	       ''                                                                                                      ||'#'|| 
	       coalesce  (pess.nome_pai            ,''        )                                                        ||'#'||
	       coalesce  (pess.nome_mae            ,''        )                                                        ||'#'||
	       coalesce  (ende.logradouro_r          ,''        )                                                        ||'#'||                
	       coalesce  (ende.numero_r              ,''        )                                                        ||'#'||                      	
	       coalesce  (ende.complemento_r         ,''        )                                                        ||'#'||                   
	       coalesce  (ende.bairro_r              ,''        )                                                        ||'#'||                     
	       coalesce  (ende.cidade_r              ,''        )                                                        ||'#'||                    
	       coalesce  (ende.uf_r                  ,''        )                                                        ||'#'||                  
	       coalesce  (ende.cep_r                 ,''        )                                                        ||'#'||                  
	       CASE WHEN (cpag.qtd_dias_atraso>5 and (cpag.id_status_conta=0 or cpag.id_status_conta = 1) )   THEN '98'
           ELSE trim(coalesce (to_char(cpag.id_status_conta  ,'99'),''))                                            
           end                                                                                                     ||'#'||
	       CASE WHEN (cpag.qtd_dias_atraso>5 and (cpag.id_status_conta=0 or cpag.id_status_conta = 1) )   THEN 'atraso antes de CRELIQ' --verificar com pedro se isso foi negociado
           ELSE coalesce(tpst.desc_status,'')                                            
           end                                                                                                     ||'#'||
	       CASE WHEN cpag.dt_hr_status_conta IS NULL THEN     '01011900'                                
		   ELSE coalesce (to_char   (cpag.dt_hr_status_conta  ,'DDMMYYYY')    , '')      
		   end																		                               ||'#'||
	       coalesce (to_char   (pess.dt_hr_inclusao      ,'DDMMYYYY')    , '')                                     ||'#'||
	       trim(coalesce (to_char(pess.ddd_tel_residencial ,'99'),''))                                             ||'#'||
           trim(coalesce(to_char(pess.tel_residencial     ,'999999999'),''))                                       ||'#'||
	       trim(coalesce (to_char(pess.ddd_tel_celular ,'99'),''))                                                 ||'#'||
           trim(coalesce(to_char(pess.tel_celular     ,'999999999'),''))                                           ||'#'||
           coalesce  (pess.email               ,''        )                                                        ||'#'||
           ''                                                                                                      ||'#'||
           trim(coalesce (to_char(cpag.limite_credito_a_vista*100   ,'9999999999'),''))                            ||'#'||
           trim(coalesce (to_char(cpag.limite_credito_parcelado*100 ,'9999999999'),''))                            ||'#'||
           trim(coalesce (to_char(cpag.limite_saque*100             ,'9999999999'),''))                            ||'#'||
           'P'                                                                                                     ||'#'|| 
           ''                                                                                                      ||'#'||
	       trim(coalesce (to_char(cred.titularidade          ,'9'),''))                                            ||'#'|| 
	       trim(coalesce (to_char(cred.flag_credencial_migrada          ,'9'),''))                                 ||'#'||     
	       coalesce  (ende.logradouro_c          ,''        )                                                        ||'#'||                
	       coalesce  (ende.numero_c              ,''        )                                                        ||'#'||                      	
	       coalesce  (ende.complemento_c         ,''        )                                                        ||'#'||                   
	       coalesce  (ende.bairro_c              ,''        )                                                        ||'#'||                     
	       coalesce  (ende.cidade_c              ,''        )                                                        ||'#'||                    
	       coalesce  (ende.uf_c                  ,''        )                                                        ||'#'||                  
	       coalesce  (ende.cep_c                 ,''        )                                                        ||'#'||                  
	       CASE cred.titularidade 
	       WHEN 1 THEN  trim(coalesce (to_char(cpag.dia_vencimento   ,'99'),''))                                                            
	       WHEN 0 THEN  ''                                  
           END                                                                                                     ||'#'||
           CASE cred.titularidade 
	       WHEN 1 THEN           coalesce (to_char   (sacc.dt_vencimento,'DDMMYYYY'),'')                                                                                   
	       WHEN 0 THEN  ''                                
           END                                                                                                     ||'#'||
          CASE cred.titularidade 
	       WHEN 1 THEN trim(coalesce (to_char(sacc_temp_saldo.saldo_fatura_atual*100 ,'9999999999'),''))                                                                                    
	       WHEN 0 THEN  ''                                  
           END                                                                                                     ||'#'||
           trim(coalesce (to_char(tapr.parcela_futura ,'9999999999'),'')) 											   ||'#'||                  
           CASE cred.titularidade 
	       WHEN 1 THEN    trim(coalesce (to_char(cpag.qtd_dias_atraso ,'9999'),''))                                                                                 
	       WHEN 0 THEN  ''                                 
           END      
                                                                                                                   ||'#'          
from        cadastral.conta_pagamento cpag
inner join  cadastral.credencial cred on cred.id_conta = cpag.id_conta 
inner join suporte.tipo_status tpst on tpst.id_status = cpag.id_status_conta  
inner join cadastral.produto_instituicao prin on prin.id_prod_instituicao = cpag.id_prod_instituicao
inner join transacional.saldo_conta_cred sacc on sacc.id_conta = cpag.id_conta 
left join transacional.temp_liquidacao_saldo_conta_cred sacc_temp_saldo on sacc_temp_saldo.id_conta = cpag.id_conta
inner join transacional.temp_saldo_conta_cred sacc_temp on sacc_temp.id_conta = sacc.id_conta and sacc.ano_mes_fat=sacc_temp.ano_mes_fat
inner join cadastral.conta_pessoa cpes on cpes.id_conta = cpag.id_conta and cred.titularidade = cpes.id_titularidade
inner join cadastral.pessoa pess on pess.id_pessoa = cpes.id_conta
inner join cadastral.temp_end_bahamas ende on ende.id_pessoa = pess.id_pessoa
left JOIN suporte.registro_arq_importacao_proposta_pf rapf ON rapf.documento = pess.documento
inner join transacional.temp_transacao_apresentada tapr on tapr.id_conta = cpag.id_conta
inner join cadastral.conta_pagamento_fat cpaf on cpaf.id_conta = cpag.id_conta 
where       cpag.id_instituicao = 1201
and         cpag.id_status_conta not in (63, 64)
and         cred.titularidade in (0, 1)
