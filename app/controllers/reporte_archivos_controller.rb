class ReporteArchivosController < ApplicationController
  before_action :set_reporte_archivo, only: [:show, :edit, :update, :destroy]

  # GET /reporte_archivos
  # GET /reporte_archivos.json
  def index

    @reporte = Reporte.find(params[:reporte_id])
    @reporte_archivos = @reporte.reporte_archivos.all
   
  end

  # GET /reporte_archivos/1
  # GET /reporte_archivos/1.json
  def show
  end

  # GET /reporte_archivos/new
  def new
    @reporte = Reporte.find(params[:reporte_id])
    @reporte_archivo = ReporteArchivo.new
  end

  # GET /reporte_archivos/1/edit
  def edit
  end

  # POST /reporte_archivos
  # POST /reporte_archivos.json
  def create
    @reporte_archivo = ReporteArchivo.new(reporte_archivo_params)
   
    
    respond_to do |format|
      if @reporte_archivo.save
        format.html { redirect_to reporte_reporte_archivos_path(@reporte_archivo.reporte_id), notice: 'Reporte archivo was successfully created.' }
      #  format.json { render :show, status: :created, location: @reporte_archivo }
      else
        format.html { render new_reporte_reporte_archivo(@reporte_archivo.reporte_id) }
       # format.json { render json: @reporte_archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reporte_archivos/1
  # PATCH/PUT /reporte_archivos/1.json
  def update
    respond_to do |format|
      if @reporte_archivo.update(reporte_archivo_params)
        format.html { redirect_to @reporte_archivo, notice: 'Reporte archivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporte_archivo }
      else
        format.html { render :edit }
        format.json { render json: @reporte_archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reporte_archivos/1
  # DELETE /reporte_archivos/1.json
  def destroy
    @reporte_archivo.destroy
    respond_to do |format|
      format.html { redirect_to reporte_archivos_url, notice: 'Reporte archivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporte_archivo
      @reporte_archivo = ReporteArchivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporte_archivo_params
      params.require(:reporte_archivo).permit(:nombre, :reporte_id)
    end
end
