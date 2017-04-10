class CtacteclisController < ApplicationController
  before_action :set_ctactecli, only: [:show, :edit, :update, :destroy]

  # GET /ctacteclis
  # GET /ctacteclis.json
  def index
    @ctacteclis = Ctactecli.all
  end

  # GET /ctacteclis/1
  # GET /ctacteclis/1.json
  def show
  end

  # GET /ctacteclis/new
  def new
    @ctactecli = Ctactecli.new
  end

  # GET /ctacteclis/1/edit
  def edit
  end

  # POST /ctacteclis
  # POST /ctacteclis.json
  def create
    @ctactecli = Ctactecli.new(ctactecli_params)

    respond_to do |format|
      if @ctactecli.save
        format.html { redirect_to @ctactecli, notice: 'Ctactecli was successfully created.' }
        format.json { render :show, status: :created, location: @ctactecli }
      else
        format.html { render :new }
        format.json { render json: @ctactecli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ctacteclis/1
  # PATCH/PUT /ctacteclis/1.json
  def update
    respond_to do |format|
      if @ctactecli.update(ctactecli_params)
        format.html { redirect_to @ctactecli, notice: 'Ctactecli was successfully updated.' }
        format.json { render :show, status: :ok, location: @ctactecli }
      else
        format.html { render :edit }
        format.json { render json: @ctactecli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ctacteclis/1
  # DELETE /ctacteclis/1.json
  def destroy
    @ctactecli.destroy
    respond_to do |format|
      format.html { redirect_to ctacteclis_url, notice: 'Ctactecli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ctactecli
      @ctactecli = Ctactecli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ctactecli_params
      params.require(:ctactecli).permit(:cliente_id, :saldo)
    end
end
