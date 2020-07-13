CREATE TABLE cadastral.temp_end_bahamas AS
select distinct on (ep.id_pessoa) id_pessoa,ep.id_endereco, ep.id_tipo_endereco,
(select ep10.logradouro from cadastral.endereco_pessoa ep10 where ep10.id_tipo_endereco = 1  and ep10.id_pessoa=ep.id_pessoa and ep10.status = 1 ) as logradouro_r,
(select ep11.numero from cadastral.endereco_pessoa ep11 where ep11.id_tipo_endereco = 1      and ep11.id_pessoa=ep.id_pessoa and ep11.status = 1) as numero_r,
(select ep12.complemento from cadastral.endereco_pessoa ep12 where ep12.id_tipo_endereco = 1 and ep12.id_pessoa=ep.id_pessoa and ep12.status = 1) as complemento_r,
(select ep13.bairro from cadastral.endereco_pessoa ep13 where ep13.id_tipo_endereco = 1      and ep13.id_pessoa=ep.id_pessoa and ep13.status = 1) as bairro_r,
(select ep14.cidade from cadastral.endereco_pessoa ep14 where ep14.id_tipo_endereco = 1      and ep14.id_pessoa=ep.id_pessoa and ep14.status = 1) as cidade_r,
(select ep15.uf from cadastral.endereco_pessoa ep15 where ep15.id_tipo_endereco = 1          and ep15.id_pessoa=ep.id_pessoa and ep15.status = 1) as uf_r,
(select ep16.cep from cadastral.endereco_pessoa ep16 where ep16.id_tipo_endereco = 1         and ep16.id_pessoa=ep.id_pessoa and ep16.status = 1) as cep_r,
(select ep17.logradouro from cadastral.endereco_pessoa ep17 where ep17.id_tipo_endereco = 2  and ep17.id_pessoa=ep.id_pessoa and ep17.status = 1) as logradouro_c,
(select ep18.numero from cadastral.endereco_pessoa ep18 where ep18.id_tipo_endereco = 2      and ep18.id_pessoa=ep.id_pessoa and ep18.status = 1) as numero_c,
(select ep19.complemento from cadastral.endereco_pessoa ep19 where ep19.id_tipo_endereco = 2 and ep19.id_pessoa=ep.id_pessoa and ep19.status = 1) as complemento_c,
(select ep20.bairro from cadastral.endereco_pessoa ep20 where ep20.id_tipo_endereco = 2      and ep20.id_pessoa=ep.id_pessoa and ep20.status = 1) as bairro_c,
(select ep21.cidade from cadastral.endereco_pessoa ep21 where ep21.id_tipo_endereco = 2      and ep21.id_pessoa=ep.id_pessoa and ep21.status = 1) as cidade_c,
(select ep22.uf from cadastral.endereco_pessoa ep22 where ep22.id_tipo_endereco = 2          and ep22.id_pessoa=ep.id_pessoa and ep22.status = 1) as uf_c,
(select ep23.cep from cadastral.endereco_pessoa ep23 where ep23.id_tipo_endereco = 2         and ep23.id_pessoa=ep.id_pessoa and ep23.status = 1) as cep_c
from cadastral.endereco_pessoa ep
where
ep.id_pessoa = 828432 AND --pq da retrição?
ep.id_endereco not in(        
 select e1.id_endereco
 from cadastral.endereco_pessoa e1,
      cadastral.endereco_pessoa e2
 where e1.id_endereco <> e2.id_endereco
 and e1.id_pessoa = e2.id_pessoa
 and e1.id_tipo_endereco = e2.id_tipo_endereco
 and e1.status = 1
 and e2.status = 1);

CREATE INDEX idx_temp_end_bahamas_id_pessoa 
ON cadastral.temp_end_bahamas(id_pessoa);
