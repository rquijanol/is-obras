require 'test_helper'

class ReportesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @reporte = reportes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reportes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reporte" do
    assert_difference('Reporte.count') do
      post :create, reporte: { cambios: @reporte.cambios, clima: @reporte.clima, fecha: @reporte.fecha, incidencias: @reporte.incidencias, obra_id: @reporte.obra_id, residente: @reporte.residente, supervisor: @reporte.supervisor }
    end

    assert_redirected_to reporte_path(assigns(:reporte))
  end

  test "should show reporte" do
    get :show, id: @reporte
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reporte
    assert_response :success
  end

  test "should update reporte" do
    patch :update, id: @reporte, reporte: { cambios: @reporte.cambios, clima: @reporte.clima, fecha: @reporte.fecha, incidencias: @reporte.incidencias, obra_id: @reporte.obra_id, residente: @reporte.residente, supervisor: @reporte.supervisor }
    assert_redirected_to reporte_path(assigns(:reporte))
  end

  test "should destroy reporte" do
    assert_difference('Reporte.count', -1) do
      delete :destroy, id: @reporte
    end

    assert_redirected_to reportes_path
  end
end
