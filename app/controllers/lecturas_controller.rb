class LecturasController < ApplicationController
  before_action :set_lectura, only: [:show, :edit, :update, :destroy]

  # GET /lecturas
  # GET /lecturas.json
  def index
    @lecturas = Lectura.includes(:cliente, :periodo).all
  end

  # GET /lecturas/1
  # GET /lecturas/1.json
  def show
  end

  # GET /lecturas/new
  def new
    @lectura = Lectura.new
  end

  # GET /lecturas/1/edit
  def edit
  end

  # POST /lecturas
  # POST /lecturas.json
  def create
    #Parámetros permitidos.
      lectura_params

    #Asignación de variables.
      numero = params[:lectura][:numero].upcase
      actual = params[:lectura][:actual].to_i
      medidor = Medidor.find_by(numero: numero)
      periodo = Periodo.last
      consumominimo = Servicio.find_by(id: 1)

    #Cálculos.
      consumototal = actual - medidor.medicion
      consumototal = actual - medidor.medicion
      if consumototal > consumominimo.m3 then
        consumoexceso = consumototal - consumominimo.m3
      else
        consumoexceso = 0
      end

    #Editar lectura.
      @lectura = Lectura.new
      @lectura.cliente_id = medidor.cliente_id
      @lectura.periodo_id = periodo.id
      @lectura.fecha = Date.today
      @lectura.numero = numero
      @lectura.actual = actual
      @lectura.consumo = consumototal
      @lectura.exceso = consumoexceso

    #Guardar lectura.
      respond_to do |format|
        if @lectura.save
          medidor.medicion = actual
          medidor.save
          puts'Lectura guardada'
          format.json { render :show, status: :created, location: @lectura }
          #format.html { redirect_to @lectura, notice: 'La lectura fue creada.' }
          #format.js { }
        else
          puts'Lectura no guardada'
          format.json { render json: @lectura.errors, status: :unprocessable_entity }
          #format.html { render :new }
        end
      end
  end

  # PATCH/PUT /lecturas/1
  # PATCH/PUT /lecturas/1.json
  def update
    respond_to do |format|
      if @lectura.update(lectura_params)
        format.html { redirect_to @lectura, notice: 'La lectura fue actualizada.' }
        format.json { render :show, status: :ok, location: @lectura }
      else
        format.html { render :edit }
        format.json { render json: @lectura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturas/1
  # DELETE /lecturas/1.json
  def destroy
    @lectura.destroy
    respond_to do |format|
      format.html { redirect_to lecturas_url, notice: 'La lectura fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lectura
      @lectura = Lectura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lectura_params
      params.require(:lectura).permit(:numero, :actual)
    end
end