-- Empresa     : CITSA
-- Programador : Juan Carlos Cardona
-- Descripcion : Trigger para actualizar usuario y fecha de modificacion en actualizaciones

-- drop trigger upd_clientes

create trigger upd_clientes_fecha
       on _clientes for update
as

  IF  not UPDATE (fecha_modificacion) and not update(usuario)  begin
			
  update _clientes
     set _clientes.fecha_modificacion = getdate(),
         _clientes.usuario = HOST_NAME()
    from _clientes, inserted
   where _clientes.codigo = inserted.codigo
   
  end  

