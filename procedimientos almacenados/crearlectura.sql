-- set @alerta="";
-- call crearlectura('ASD001', 40, @alerta);
-- select @alerta;
drop procedure if exists crearlectura;
DELIMITER $$
create PROCEDURE crearlectura(in medidor varchar(255), in lecturaactual int, out alerta int)
begin

    -- Declaración de variables.
    DECLARE cliente int default 0;
	DECLARE periodo int default 0;
	DECLARE consumominimo int default 0;
    DECLARE lecturaanterior int default 0;
	DECLARE consumototal int default 0;
    DECLARE consumoexceso int default 0;

	-- Asignación de variables.
    select cliente_id from medidors where (medidors.numero=medidor) into cliente;
    select max(id) from periodos into periodo;
    select m3 from servicios where id=1 into consumominimo;
	select medidors.medicion from medidors where (medidors.numero=medidor) into lecturaanterior;

	-- Cálculos
	set consumototal = (lecturaactual - lecturaanterior);
	if consumototal > consumominimo then
		set consumoexceso = consumototal - consumominimo;
	else
		set consumoexceso = 0;
	end if;

    -- Iniciamos la transacción para insertar lecturas y actualizar medidores.
	START TRANSACTION;
		-- Cambiamos el commit automatico a apagado
		set autocommit = 0;
		insert into lecturas (cliente_id, periodo_id, fecha, numero, actual, consumo, exceso, created_at, updated_at) values (cliente, periodo, current_date(), medidor, lecturaactual, consumototal, consumoexceso, current_timestamp(), current_timestamp());
		update medidors set medicion=lecturaactual where (medidors.numero=medidor);
	COMMIT;
    -- Retornamos la alerta exitosa.
	set alerta = 25;
    select alerta;
end
$$