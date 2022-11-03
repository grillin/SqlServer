-- Empresa     : CITSA
-- Programador : Juan Carlos Cardona
-- Descripcion : Trigger para actualizar usuario y fecha de modificacion en inserciones

-- drop trigger ins_pdvs

create trigger ins_clientes_fecha
       on _clientes for insert
as

  update _clientes
     set _clientes.fecha_modificacion = getdate(),
         _clientes.usuario = HOST_NAME()
    from _clientes, inserted
   where _clientes.codigo = inserted.codigo
   


