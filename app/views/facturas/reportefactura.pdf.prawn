prawn_document do |pdf|

    pdf.stroke_axis

    #pdf.text "#{Date.today.strftime("%d-%m-%Y")}"

	@facturas.each do |factura|

		#Título de factura
        pdf.text "FACTURA GOTAPP", :size => 20, :style => :bold, :align => :center
		pdf.stroke_horizontal_rule
        pdf.move_down 10

        #Encabezado de factura
        pdf.draw_text "Vencimiento: #{factura.periodo.fecha_vencimiento.strftime("%d-%m-%Y")}", :at => [20, 725]
        pdf.draw_text "Fecha: #{factura.fecha.strftime("%d-%m-%Y")}", :at => [350, 725]
        pdf.draw_text "Nombre cliente: #{factura.cliente.nombre}", :at => [20, 705]
        pdf.draw_text "RUC/CI: #{number_with_delimiter(factura.cliente.ci, delimiter: ".")}", :at => [350, 705]
        pdf.draw_text "Dirección: #{factura.cliente.direccion}", :at => [20, 685]
        pdf.draw_text "Condición: #{factura.condicion}", :at => [350, 685]

        #Datos de medición
        pdf.rounded_rectangle [0, 670], 520, 50, 20

        pdf.draw_text "Periodo de", :at => [20, 655]
        pdf.draw_text "consumo", :at => [25, 640]      
        pdf.draw_text "#{factura.periodo.periodo.strftime("%m-%Y")}", :at => [25, 625]
        
        lectu = Lectura.where(cliente_id: factura.cliente_id, periodo_id: factura.periodo_id)
        min = Servicio.where(id: 1)
        
        pdf.draw_text "Lectura", :at => [100, 655]
        pdf.draw_text "anterior", :at => [100, 640]

        pdf.draw_text "Lectura", :at => [165, 655]
        pdf.draw_text "actual", :at => [170, 640] 
        pdf.draw_text "#{lectu.take.actual}", :at => [175, 625]

        pdf.draw_text "Total", :at => [240, 655]
        pdf.draw_text "consumo", :at => [230, 640]
        pdf.draw_text "#{lectu.take.consumo}", :at => [240, 625]

        pdf.draw_text "Consumo", :at => [300, 655]
        pdf.draw_text "minimo", :at => [305, 640]
        pdf.draw_text "#{min.take.m3}", :at => [315, 625]

        pdf.draw_text "Consumo", :at => [380, 655]
        pdf.draw_text "exceso", :at => [385, 640]
        pdf.draw_text "#{lectu.take.exceso}", :at => [400, 625]

        pdf.draw_text "Factura", :at => [460, 655]
        pdf.draw_text "numero", :at => [460, 640]
        pdf.draw_text "#{factura.id}", :at => [470, 625]

        pdf.move_down 130

    	pdf.text "DETALLE FACTURA", :size => 14, :style => :bold, :align => :center
    	pdf.move_down 30
        pdf.stroke_horizontal_rule

        pdf.move_down 5
        pdf.draw_text "DESCRIPCION", :at => [20, 570], :style => :italic
        pdf.draw_text "PRECIO", :at => [470, 570], :style => :italic
        
        deta = Detallefactura.includes(:servicio).where(factura_id: factura.id)
    	deta.each do |detalle|
            pdf.text "*** #{detalle.servicio.concepto} ............................................................................................................. #{number_with_delimiter(detalle.subtotal, delimiter: ".")}"
    		pdf.move_down 5
    	end
        pdf.text "*** ERSSAN .......................................................................................................................... #{number_with_delimiter(factura.erssan, delimiter: ".")}"

        pdf.move_down 5
        pdf.stroke_horizontal_rule
        pdf.move_down 10
        pdf.text "TOTAL: #{number_with_delimiter(factura.total, delimiter: ".")}", :align => :right
        pdf.move_down 10
        pdf.text "IVA(10%): #{number_with_delimiter(factura.iva, delimiter: ".")}", :align => :right
    	pdf.start_new_page
  	end

end