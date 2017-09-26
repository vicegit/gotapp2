class PagosController < ApplicationController
  before_action :set_pago, only: [:show, :edit, :update, :destroy]

  # GET /pagos
  # GET /pagos.json
  def index
    @pagos = Pago.all
  end

  # GET /pagos/1
  # GET /pagos/1.json
  def show
  end

  # GET /pagos/new
  def new
    @pago = Pago.new
  end

  # GET /pagos/1/edit
  def edit
  end

  # POST /pagos
  # POST /pagos.json
  def create
    #Parámetros permitidos.
      pago_params

    #Asignación de variables.
      fact = params[:pago][:factura_id]
      fecha = params[:pago][:fechapago]
      factura = Factura.find_by(id: fact)

    #Editar pago.
      @pago = Pago.new
      @pago.factura_id = fact
      @pago.fechapago = fecha
      @pago.monto = factura.total

    respond_to do |format|
      if @pago.save
        #Inserción en la cuenta corriente cliente por el haber.
        ctactecli = Ctactecli.find_by(cliente_id: factura.cliente_id)
        detallectactecli = Detallectactecli.new
        detallectactecli.ctactecli_id = factura.cliente_id
        detallectactecli.fechadetalle = Date.today
        detallectactecli.tipodetalle = 'Crédito por factura'
        detallectactecli.haber = factura.total
        detallectactecli.save
        ctactecli.saldo = ctactecli.saldo - factura.total
        ctactecli.save

        format.json { render :show, status: :created, location: @pago }
        puts'Pago guardado'
        #format.html { redirect_to @pago, notice: 'Pago was successfully created.' }
      else
        format.json { render json: @pago.errors, status: :unprocessable_entity }
        puts'Pago no guardado'
        #format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pagos/1
  # PATCH/PUT /pagos/1.json
  def update
    respond_to do |format|
      if @pago.update(pago_params)
        format.html { redirect_to @pago, notice: 'Pago was successfully updated.' }
        format.json { render :show, status: :ok, location: @pago }
      else
        format.html { render :edit }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos/1
  # DELETE /pagos/1.json
  def destroy
    @pago.destroy
    respond_to do |format|
      format.html { redirect_to pagos_url, notice: 'Pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_params
      params.require(:pago).permit(:factura_id, :fechapago)
    end
end
