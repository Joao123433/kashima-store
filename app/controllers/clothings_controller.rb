class ClothingsController < ApplicationController
  before_action :set_clothing, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  # GET /clothings or /clothings.json
  def index
    @clothings = Clothing.all
  end

  # GET /clothings/1 or /clothings/1.json
  def show
  end

  # GET /clothings/new
  def new
    @clothing = Clothing.new
  end

  # GET /clothings/1/edit
  def edit
  end

  # POST /clothings or /clothings.json
  def create
    @clothing = Clothing.new(clothing_params)

    respond_to do |format|
      if @clothing.save
        format.html { redirect_to clothing_url(@clothing), notice: "Roupa criada com sucesso." }
        format.json { render :show, status: :created, location: @clothing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clothing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clothings/1 or /clothings/1.json
  def update
    respond_to do |format|
      if @clothing.update(clothing_params)
        format.html { redirect_to clothing_url(@clothing), notice: "Roupa atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @clothing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clothing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clothings/1 or /clothings/1.json
  def destroy
    @clothing.destroy

    respond_to do |format|
      format.html { redirect_to clothings_url, notice: "Roupa deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing
      @clothing = Clothing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clothing_params
      params.require(:clothing).permit(:label, :price, :path, :quant, :description)
    end
end
