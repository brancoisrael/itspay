CREATE TABLE cadastral.temp_produto_instituicao_config_credito as
select cpag.id_conta , picc.qt_dias_to_perda
from  cadastral.conta_pagamento cpag
inner join  cadastral.produto_instituicao_config_credito picc on picc.id_instituicao  = cpag.id_instituicao 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
       and picc.id  in(select max(picc2.id) from cadastral.produto_instituicao_config_credito picc2  where picc2.id_instituicao  = cpag.id_instituicao);
       
CREATE INDEX idx_produto_instituicao_config_credito_id_conta
ON cadastral.temp_produto_instituicao_config_credito (id_conta);

/*



-- 71.071
select count(*)--cpag.id_conta , picc.qt_dias_to_perda
from  cadastral.conta_pagamento cpag
inner join  cadastral.produto_instituicao_config_credito picc on picc.id_instituicao  = cpag.id_instituicao 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
       and picc.id  in(select max(picc2.id) from cadastral.produto_instituicao_config_credito picc2  where picc2.id_instituicao  = cpag.id_instituicao);
   
-- 71.071
select count(*)--cpag.id_conta , picc.qt_dias_to_perda
from  cadastral.conta_pagamento cpag
inner join  cadastral.produto_instituicao_config_credito picc on picc.id_prod_instituicao  = cpag.id_prod_instituicao 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
       and picc.id  in(select max(picc2.id) from cadastral.produto_instituicao_config_credito picc2  where picc2.id_prod_instituicao  = cpag.id_prod_instituicao);
*/       