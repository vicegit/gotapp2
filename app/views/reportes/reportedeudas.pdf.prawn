prawn_document do |pdf|

	pdf.text "TOTAL DEUDAS DEL MES", :size => 20, :style => :bold, :align => :center
	pdf.stroke_horizontal_rule
    pdf.move_down 20

    pdf.text "Cantidad de deudores: #{number_with_delimiter(@cantDeuda, delimiter: ".")}"
    pdf.move_down 10

    pdf.text "Total deuda: #{number_with_delimiter(@sumTotDeuda, delimiter: ".")} Gs."
    pdf.move_down 10

    pdf.text "Promedio deuda: #{number_with_delimiter(@promDeuda.to_i, delimiter: ".")} Gs."
    pdf.move_down 10

    pdf.text "Lista de deudores", :style => :bold
    pdf.move_down 10

    @deuda.each do |deu|
    	pdf.text "Cliente: #{deu.cliente.nombre}"
    	pdf.move_down 10
    end

end