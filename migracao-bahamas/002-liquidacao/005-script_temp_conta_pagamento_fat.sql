CREATE TABLE cadastral.temp_conta_pagamento_fat AS
select cpag.id_conta , max(cpaf.dt_vencimento_atual) dt_vencimento_atual	
from   cadastral.conta_pagamento cpag
inner join cadastral.conta_pagamento_fat cpaf on cpaf.id_conta = cpag.id_conta 
where  cpag.id_instituicao = 1201
       and  cpag.id_status_conta IN (68,70)
group by cpag.id_conta;
  

CREATE INDEX idx_temp_conta_pagamento_id_conta
ON cadastral.temp_conta_pagamento(id_conta);

