require 'test_helper'

class ReporteArchivosControllerTest < ActionController::TestCase
  setup do
    @reporte_archivo = reporte_archivos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reporte_archivos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reporte_archivo" do
    assert_difference('ReporteArchivo.count') do
      post :create, reporte_archivo: { nombre: @reporte_archivo.nombre, path: @reporte_archivo.path, reporte_id: @reporte_archivo.reporte_id, tipo: @reporte_archivo.tipo }
    end

    assert_redirected_to reporte_archivo_path(assigns(:reporte_archivo))
  end

  test "should show reporte_archivo" do
    get :show, id: @reporte_archivo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reporte_archivo
    assert_response :success
  end

  test "should update reporte_archivo" do
    patch :update, id: @reporte_archivo, reporte_archivo: { nombre: @reporte_archivo.nombre, path: @reporte_archivo.path, reporte_id: @reporte_archivo.reporte_id, tipo: @reporte_archivo.tipo }
    assert_redirected_to reporte_archivo_path(assigns(:reporte_archivo))
  end

  test "should destroy reporte_archivo" do
    assert_difference('ReporteArchivo.count', -1) do
      delete :destroy, id: @reporte_archivo
    end

    assert_redirected_to reporte_archivos_path
  end
end
