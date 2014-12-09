json.array!(@reporte_detalles) do |reporte_detalle|
  json.extract! reporte_detalle, :id, :categoria, :numeropersonas, :reporte_id
  json.url reporte_detalle_url(reporte_detalle, format: :json)
end
