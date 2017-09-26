$(document).on "ajax:success", "form#pago_id", (ev, data)->
	alert 'Pago creado'
	
	$('#pago_factura_id').val('')

	$('#pago_fechapago').val('')

	$('#pago_factura_id').focus()

$(document).on "ajax:error", "form#pago_id", (ev, data)->
	alert 'Pago no creado'

	$('#pago_factura_id').focus()
