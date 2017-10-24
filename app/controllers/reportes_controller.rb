class ReportesController < ApplicationController
  
  def index
  	
  end
  
  def reportebalance
    @cantFactura = Factura.where(periodo_id: Periodo.last.id).count
    @sumTotFactura = Factura.where(periodo_id: Periodo.last.id).sum(:total)
    @promFactura = Factura.where(periodo_id: Periodo.last.id).average(:total)
    @sumTotErssan = Factura.where(periodo_id: Periodo.last.id).sum(:erssan)
    @sumTotIva = Factura.where(periodo_id: Periodo.last.id).sum(:iva)
  end

	def reporteconsumo
    @cantLectura = Lectura.where(periodo_id: Periodo.last.id).count
    @cantExceso = Lectura.where(periodo_id: Periodo.last.id).where("exceso > 0").count
    @sumTotLectura = Lectura.where(periodo_id: Periodo.last.id).sum(:consumo)
    @promLectura = Lectura.where(periodo_id: Periodo.last.id).average(:consumo)
  end

  def reportedeudas
    @cantDeuda = Ctactecli.where("saldo != 0").count
    @sumTotDeuda = Ctactecli.where("saldo != 0").sum(:saldo)
    @promDeuda = Ctactecli.where("saldo != 0").average(:saldo)
    @deuda = Ctactecli.includes(:cliente).where("saldo != 0")
  end

  def reportepagos
  	@cantPago = Factura.joins(:pago).where(periodo_id: Periodo.last.id).count
    @sumTotPago = Factura.joins(:pago).where(periodo_id: Periodo.last.id).sum(:monto)
    @promPago = Factura.joins(:pago).where(periodo_id: Periodo.last.id).average(:monto)
  end

end
