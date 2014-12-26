require 'test_helper'

class ReportesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @reporte = reportes(:one)
  end

  test "should get index" do
    get :index ,:obra_id=> 1
    assert_response :success
    assert_not_nil assigns(:reportes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reporte" do
    assert_difference('Reporte.count') do
      
      post :create, reporte: { cambios: @reporte.cambios, clima: @reporte.clima, fecha: @reporte.fecha, incidencias: @reporte.incidencias, obra_id: @reporte.obra_id, residente: @reporte.residente, supervisor: @reporte.supervisor }, :obra_id=> 1
    end

    assert_redirected_to reporte_path(assigns(:reporte))
  end

  test "should show reporte" do
    get :show, id: @reporte
    assert_response :success
  end

  test "should destroy reporte" do
    assert_difference('Reporte.count', -1) do
      delete :destroy, id: @reporte ,:obra_id=> 1
    end

    assert_redirected_to reportes_path
  end
end
