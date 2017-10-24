prawn_document do |pdf|

	pdf.text "TOTAL CONSUMO DEL MES #{Periodo.last.periodo.strftime("%m-%Y")}", :size => 20, :style => :bold, :align => :center
	pdf.stroke_horizontal_rule
    pdf.move_down 20
    
    pdf.text "Cantidad de lecturas: #{number_with_delimiter(@cantLectura, delimiter: ".")}"
    pdf.move_down 10

    pdf.text "Cantidad de clientes excedidos: #{number_with_delimiter(@cantExceso, delimiter: ".")}"
    pdf.move_down 10

    pdf.text "Consumo total: #{number_with_delimiter(@sumTotLectura, delimiter: ".")} M3."
    pdf.move_down 10

    pdf.text "Promedio de consumo: #{number_with_delimiter(@promLectura.to_i, delimiter: ".")} M3."

end