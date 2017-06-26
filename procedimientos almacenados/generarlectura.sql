-- call generarlectura();
drop procedure if exists generarlectura;
DELIMITER $$
create PROCEDURE generarlectura(in medidor varchar(255), in lecturaactual int)
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

	-- Actualizaciones
	insert into lecturas (cliente_id, periodo_id, fecha, actual, consumo, exceso, created_at, updated_at) values (cliente, periodo, current_date(), lecturaactual, consumototal, consumoexceso, current_timestamp(), current_timestamp());
	update medidors set medicion=lecturaactual where (medidors.numero=medidor);

end
$$