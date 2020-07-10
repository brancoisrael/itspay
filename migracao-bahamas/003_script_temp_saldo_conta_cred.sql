CREATE TABLE transacional.temp_saldo_conta_cred AS
select cre2.id_credencial , cre2.id_conta, max(cre2.csn) csn 
from cadastral.credencial cre2 
where cre2.titularidade in (0,1)
group by cre2.id_credencial, cre2.id_conta
CREATE INDEX idx_temp_saldo_conta_cred_id_conta
ON cadastral.temp_saldo_conta_cred(id_conta);