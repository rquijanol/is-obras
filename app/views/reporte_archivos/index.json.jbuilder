json.array!(@reporte_archivos) do |reporte_archivo|
  json.extract! reporte_archivo, :id, :nombre, :path, :tipo, :reporte_id
  json.url reporte_archivo_url(reporte_archivo, format: :json)
end
