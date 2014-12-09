json.array!(@reportes) do |reporte|
  json.extract! reporte, :id, :clima, :fecha, :incidencias, :cambios, :residente, :supervisor, :obra_id
  json.url reporte_url(reporte, format: :json)
end
