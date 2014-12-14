require 'test_helper'

class ReporteDetallesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @reporte_detalle = reporte_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reporte_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reporte_detalle" do
    assert_difference('ReporteDetalle.count') do
      post :create, reporte_detalle: { categoria: @reporte_detalle.categoria, numeropersonas: @reporte_detalle.numeropersonas, reporte_id: @reporte_detalle.reporte_id }
    end

    assert_redirected_to reporte_detalle_path(assigns(:reporte_detalle))
  end

  test "should show reporte_detalle" do
    get :show, id: @reporte_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reporte_detalle
    assert_response :success
  end

  test "should update reporte_detalle" do
    patch :update, id: @reporte_detalle, reporte_detalle: { categoria: @reporte_detalle.categoria, numeropersonas: @reporte_detalle.numeropersonas, reporte_id: @reporte_detalle.reporte_id }
    assert_redirected_to reporte_detalle_path(assigns(:reporte_detalle))
  end

  test "should destroy reporte_detalle" do
    assert_difference('ReporteDetalle.count', -1) do
      delete :destroy, id: @reporte_detalle
    end

    assert_redirected_to reporte_detalles_path
  end
end
