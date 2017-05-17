class MedidorsController < ApplicationController
  before_action :set_medidor, only: [:show, :edit, :update, :destroy]

  # GET /medidors
  # GET /medidors.json
  def index
    @medidors = Medidor.all
  end

  # GET /medidors/1
  # GET /medidors/1.json
  def show
  end

  # GET /medidors/new
  def new
    @medidor = Medidor.new
  end

  # GET /medidors/1/edit
  def edit
  end

  # POST /medidors
  # POST /medidors.json
  def create
    @medidor = Medidor.new(medidor_params)

    respond_to do |format|
      if @medidor.save
        format.html { redirect_to @medidor, notice: 'El medidor fue creado.' }
        format.json { render :show, status: :created, location: @medidor }
      else
        format.html { render :new }
        format.json { render json: @medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medidors/1
  # PATCH/PUT /medidors/1.json
  def update
    respond_to do |format|
      if @medidor.update(medidor_params)
        format.html { redirect_to @medidor, notice: 'El medidor fue actualizado.' }
        format.json { render :show, status: :ok, location: @medidor }
      else
        format.html { render :edit }
        format.json { render json: @medidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medidors/1
  # DELETE /medidors/1.json
  def destroy
    @medidor.destroy
    respond_to do |format|
      format.html { redirect_to medidors_url, notice: 'El medidor fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medidor
      @medidor = Medidor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medidor_params
      params.require(:medidor).permit(:numero, :medicion, :estado_medidor)
    end
end
