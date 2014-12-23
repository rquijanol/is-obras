module ApplicationHelper
  
  def full_title(page_title = '')
    base_title = "QUBE Control de Obra"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def nombre_empresa
      "Ique Sidi Construcciones S.A. de C.V."
  end
end
