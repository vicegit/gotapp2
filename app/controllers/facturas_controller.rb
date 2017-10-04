class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :edit, :update, :destroy]

  # GET /facturas
  # GET /facturas.json
  def index
    @facturas = Factura.includes(:cliente, :periodo).all
  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show
    @detallesfac = Detallefactura.includes(:servicio).where(factura_id: @factura.id)
  end

  # GET /facturas/new
  def new
    @factura = Factura.new
  end

  # GET /facturas/1/edit
  def edit
  end

  def facturar
    #Asignación de variables.
    periodo = Periodo.last.id
    minimo = Servicio.find_by(id: 1)
    exceso = Servicio.find_by(id: 2)

    #Iteración sobre los clientes activos para la creación de sus respectivas facturas.
    cliente = Cliente.select(:id).joins(:ctacteclis).where(ctacteclis: { estado_cuenta: true })
    cliente.each do |cli|
    
      #Inserción en cabecera de factura.
      fac = Factura.new
      fac.cliente_id = cli.id
      fac.periodo_id = periodo
      fac.condicion = 'CRÉDITO'
      fac.fecha = Date.today
      fac.save
      #Inserción en detalle de factura del mínimo.
      detalle1 = Detallefactura.new
      detalle1.factura_id = Factura.last.id
      detalle1.servicio_id = minimo.id
      detalle1.subtotal = minimo.tarifa
      detalle1.save
      #Inserción en detalle de factura del exceso.
      cantidadexceso = Lectura.find_by(cliente_id: cli.id, periodo_id: periodo)
      totaltarifaexceso = cantidadexceso.exceso * exceso.tarifa
      detalle2 = Detallefactura.new
      detalle2.factura_id = Factura.last.id
      detalle2.servicio_id = exceso.id
      detalle2.subtotal = totaltarifaexceso
      detalle2.save
      #Actualización de la cabecera de factura.
      totalerssan = ((minimo.tarifa + totaltarifaexceso) * 0.02).to_i
      totalfacturacion = (minimo.tarifa + totaltarifaexceso + totalerssan).to_i
      totaliva = ((minimo.tarifa + totaltarifaexceso) / 11).to_i
      fac.iva = totaliva
      fac.erssan = totalerssan
      fac.total = totalfacturacion
      fac.save
      #Inserción en la cuenta corriente cliente por el debe.
      ctactecli = Ctactecli.find_by(cliente_id: cli.id)
      detallectactecli = Detallectactecli.new
      detallectactecli.ctactecli_id = ctactecli.id
      detallectactecli.fechadetalle = Date.today
      detallectactecli.tipodetalle = 'Débito por factura'
      detallectactecli.debe = totalfacturacion
      detallectactecli.save
      ctactecli.saldo = ctactecli.saldo + totalfacturacion
      ctactecli.save
    end
  end

  # POST /facturas
  # POST /facturas.json
  def create
    @factura = Factura.new(factura_params)

    respond_to do |format|
      if @factura.save
        format.html { redirect_to @factura, notice: 'La factura fue creada.' }
        format.json { render :show, status: :created, location: @factura }
      else
        format.html { render :new }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturas/1
  # PATCH/PUT /facturas/1.json
  def update
    respond_to do |format|
      if @factura.update(factura_params)
        format.html { redirect_to @factura, notice: 'La factura fue actualizada.' }
        format.json { render :show, status: :ok, location: @factura }
      else
        format.html { render :edit }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.json
  def destroy
    @factura.destroy
    respond_to do |format|
      format.html { redirect_to facturas_url, notice: 'La factura fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura
      @factura = Factura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factura_params
      params.require(:factura).permit(:cliente_id, :periodo_id, :condicion, :fecha, :iva, :erssan, :total)
    end
end