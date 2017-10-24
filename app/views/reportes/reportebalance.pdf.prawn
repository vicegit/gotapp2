prawn_document do |pdf|

	pdf.text "BALANCE FACTURACIÓN #{Periodo.last.periodo.strftime("%m-%Y")}", :size => 20, :style => :bold, :align => :center
	pdf.stroke_horizontal_rule
    pdf.move_down 20
    
    pdf.text "Cantidad de facturas: #{number_with_delimiter(@cantFactura, delimiter: ".")}"
    pdf.move_down 10

    pdf.text "Total facturado: #{number_with_delimiter(@sumTotFactura, delimiter: ".")} Gs."
    pdf.move_down 10

   	pdf.text "Promedio facturado: #{number_with_delimiter(@promFactura.to_i, delimiter: ".")}"
    pdf.move_down 10
    
    pdf.text "Total ERSSAN facturado: #{number_with_delimiter(@sumTotErssan, delimiter: ".")} Gs."
	pdf.move_down 10
    
    pdf.text "Total IVA facturado: #{number_with_delimiter(@sumTotIva, delimiter: ".")} Gs."
end