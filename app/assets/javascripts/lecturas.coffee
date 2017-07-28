$(document).on "ajax:success", "form#lectura_id", (ev, data)->
	alert 'Lectura creada'
	
	$('#lectura_numero').val('')

	$('#lectura_actual').val('')

	$('#lectura_numero').focus()

$(document).on "ajax:error", "form#lectura_id", (ev, data)->
	alert 'Lectura no creada'

	$('#lectura_numero').focus()