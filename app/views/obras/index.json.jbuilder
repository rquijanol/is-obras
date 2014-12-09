json.array!(@obras) do |obra|
  json.extract! obra, :id, :nombre, :importe, :plazo, :fechainicial, :fechafinal, :empresa_id
  json.url obra_url(obra, format: :json)
end
