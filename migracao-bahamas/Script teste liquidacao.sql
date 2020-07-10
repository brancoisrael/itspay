select temp_bahamas.documento,  
           max(temp_bahamas.id_bahamas)                                                                          ||'#'||  
           trim(coalesce (to_char(100*(
                    max(temp_bahamas.saldo_fatura_atual)+sum((temp_bahamas.parcela_qtd-temp_bahamas.parcela_nro_parcela) 
                    * temp_bahamas.valor_moeda_liquidacao)
           ) ,'9999999999'),''))                           ||'#'||  
	       trim(coalesce (to_char(     cast(max(temp_bahamas.qt_dias_to_perda) as integer) +
	                                    max(temp_bahamas.dt_vencimento_atual) ,'DDMMYYYY'),''))                  ||'#'||  
	       ''                                                                                                    ||'#'   
	       as arquivo_exp
FROM
(
select pess.documento, 
       tapr.valor_moeda_liquidacao, 
       tapr.parcela_nro_parcela, 
       tapr.parcela_qtd,
       sacc.saldo_fatura_atual, 
       cpag.id_prod_instituicao, 
       picc.qt_dias_to_perda, 
       cpaf.dt_vencimento_atual,
	       coalesce            (pess.documento            ,''        )                                                            ||'#'||
	       coalesce (to_char   (cpaf.dt_vencimento_atual  ,'DDMMYYYY')    , '')                                                   ||'#'||
	       coalesce (to_char   (cpaf.dt_vencimento_atual  ,'DDMMYYYY')    , '')                                                   ||'#'||
	       trim(coalesce (to_char(cpag.qtd_dias_atraso ,'9999'),''))                                                              ||'#'||
	       coalesce (to_char   (escc.dt_hr_entrada     ,'DDMMYYYY')    , '')                                                      ||'#'||
	       coalesce (to_char   (escc.dt_hr_saida       ,'DDMMYYYY')    , '')                                                      ||'#'||
	       ''                                                                                                                     ||'#'   as id_bahamas,
	       max (sacc.id_saldo_conta_cred ) as sacc_id_saldo_conta_cred
FROM         cadastral.pessoa_temp             pess,
	   	     cadastral.conta_pessoa_temp        cpes,
	   	     cadastral.conta_pagamento_temp     cpag,
	   	     cadastral.conta_pagamento_fat_temp cpaf,
  	   	     transacional.transacao_apresentada_temp tapr,
  	   	     transacional.saldo_conta_cred_temp sacc,
	   	     cadastral.escritorio_cobranca_conta_temp escc,
	   	     cadastral.produto_instituicao_config_credito_temp picc,
	   	     cadastral.produto_instituicao_temp prin
where         cpes.id_pessoa = pess.id_pessoa
	   	and   cpes.id_conta  = cpag.id_conta
	   	and   cpag.id_conta = cpaf.id_conta
	   	and   prin.id_prod_instituicao = cpag.id_prod_instituicao
	   	and   cpag.id_conta = tapr.id_conta
	   	and   cpag.id_conta = sacc.id_conta
	   	and   picc.id_prod_instituicao = cpag.id_prod_instituicao
	   	and   escc.id_conta = cpes.id_conta
	    and   cpag.id_instituicao = 1201
        and   (cpag.id_status_conta = 68 or cpag.id_status_conta = 70)
--        and tapr.cod_rede = '2'
--        and tapr.valor_moeda_origem  = 31
--      and pess.id_pessoa = 822837
group by pess.documento, 
       tapr.valor_moeda_liquidacao, 
       tapr.parcela_nro_parcela, 
       tapr.parcela_qtd,
       sacc.saldo_fatura_atual, 
       cpag.id_prod_instituicao, 
       picc.qt_dias_to_perda, 
       cpaf.dt_vencimento_atual,
       id_bahamas
       limit 300
) as temp_bahamas
group by temp_bahamas.documento