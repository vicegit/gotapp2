prawn_document do |pdf|

	pdf.text "TOTAL PAGOS DEL MES #{Periodo.last.periodo.strftime("%m-%Y")}", :size => 20, :style => :bold, :align => :center
	pdf.stroke_horizontal_rule
    pdf.move_down 20

    pdf.text "Cantidad de pagos: #{number_with_delimiter(@cantPago, delimiter: ".")}"
    pdf.move_down 10

    pdf.text "Total de pagos: #{number_with_delimiter(@sumTotPago, delimiter: ".")}"
    pdf.move_down 10

    pdf.text "Promedio de pagos: #{number_with_delimiter(@promPago.to_i, delimiter: ".")}"
    pdf.move_down 10

end