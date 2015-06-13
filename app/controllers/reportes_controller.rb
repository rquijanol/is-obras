class ReportesController < ApplicationController
  before_action :set_reporte, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /reportes
  # GET /reportes.json
  def index
   if params[:obra_id] != nil
    session[:return_to] = request.referer
    @obra = Obra.find(params[:obra_id])
    @reportes = @obra.reportes.all #.paginate(page: params[:page])
   else
    @reportes= [];
   end
  end

  # GET /reportes/1
  # GET /reportes/1.json
  def show
    @reporte = Reporte.find(params[:id])
    @reporte_detalles = @reporte.reporte_detalles.paginate(page: params[:page])
    
     respond_to do |format|
      format.html
      format.pdf { render :pdf => "report", :layout => 'pdf.html.erb' }
      
      end
    
    
    

  end
  
  
  def showpdf
    @reporte = Reporte.find(params[:reporte_id])
    render :pdf_show
  end

  # GET /reportes/new
  def new
    @obra = Obra.find(params[:obra_id])
    @reporte = @obra.reportes.new
    
  end

  # GET /reportes/1/edit
  def edit
  end

  # POST /reportes
  # POST /reportes.json
  def create
    
    
    @reporte = Reporte.new(reporte_params)

    respond_to do |format|
      if @reporte.save
      format.html { redirect_to obra_reportes_path(@reporte.obra_id), notice: 'Reporte was successfully created.' }
      #  format.json { render :show, status: :created, location: @reporte }
      else
       format.html { redirect_to new_obra_reporte_path(@reporte.obra_id) }
      # format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reportes/1
  # PATCH/PUT /reportes/1.json
  def update
    respond_to do |format|
      if @reporte.update(reporte_params)
        format.html { redirect_to @reporte, notice: 'Reporte was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporte }
      else
        format.html { render :edit }
        format.json { render json: @reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportes/1
  # DELETE /reportes/1.json
  def destroy
    @reporte.destroy
    respond_to do |format|
      format.html { redirect_to obra_reportes_path(@reporte.obra_id), notice: 'Reporte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporte
      @reporte = Reporte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporte_params
      params.require(:reporte)
       .permit(:clima, :fecha, :incidencias, :cambios, :residente, :supervisor, :obra_id,
        reporte_detalles_attributes: [:categoria, :numeropersonas, :_detroy, :id])
    end
    
    def filtering_params(params)
      params.slice(:status, :location, :starts_with)
    end
end
