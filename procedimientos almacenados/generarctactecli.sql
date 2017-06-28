-- call generarctactecli();
drop procedure if exists generarctactecli;
DELIMITER $$
create PROCEDURE generarctactecli()
begin
	-- Declaración de variables.
    DECLARE cliente int default 0;
	
    -- Buscar el cliente.
    select max(id) from clientes into cliente;
    
    -- Insertar el cliente en la ctactecli.
    insert into ctacteclis (cliente_id, created_at, updated_at) values (cliente, current_timestamp(), current_timestamp());
end
$$