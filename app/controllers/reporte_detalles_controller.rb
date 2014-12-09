class ReporteDetallesController < ApplicationController
  before_action :set_reporte_detalle, only: [:show, :edit, :update, :destroy]

  # GET /reporte_detalles
  # GET /reporte_detalles.json
  def index
    @reporte_detalles = ReporteDetalle.all
  end

  # GET /reporte_detalles/1
  # GET /reporte_detalles/1.json
  def show
  end

  # GET /reporte_detalles/new
  def new
    @reporte_detalle = ReporteDetalle.new
  end

  # GET /reporte_detalles/1/edit
  def edit
  end

  # POST /reporte_detalles
  # POST /reporte_detalles.json
  def create
    @reporte_detalle = ReporteDetalle.new(reporte_detalle_params)

    respond_to do |format|
      if @reporte_detalle.save
        format.html { redirect_to @reporte_detalle, notice: 'Reporte detalle was successfully created.' }
        format.json { render :show, status: :created, location: @reporte_detalle }
      else
        format.html { render :new }
        format.json { render json: @reporte_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reporte_detalles/1
  # PATCH/PUT /reporte_detalles/1.json
  def update
    respond_to do |format|
      if @reporte_detalle.update(reporte_detalle_params)
        format.html { redirect_to @reporte_detalle, notice: 'Reporte detalle was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporte_detalle }
      else
        format.html { render :edit }
        format.json { render json: @reporte_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reporte_detalles/1
  # DELETE /reporte_detalles/1.json
  def destroy
    @reporte_detalle.destroy
    respond_to do |format|
      format.html { redirect_to reporte_detalles_url, notice: 'Reporte detalle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporte_detalle
      @reporte_detalle = ReporteDetalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporte_detalle_params
      params.require(:reporte_detalle).permit(:categoria, :numeropersonas, :reporte_id)
    end
end
