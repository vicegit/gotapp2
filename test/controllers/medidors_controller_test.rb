require 'test_helper'

class MedidorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medidor = medidors(:one)
  end

  test "should get index" do
    get medidors_url
    assert_response :success
  end

  test "should get new" do
    get new_medidor_url
    assert_response :success
  end

  test "should create medidor" do
    assert_difference('Medidor.count') do
      post medidors_url, params: { medidor: { estado_medidor: @medidor.estado_medidor, medicion: @medidor.medicion, numero: @medidor.numero } }
    end

    assert_redirected_to medidor_url(Medidor.last)
  end

  test "should show medidor" do
    get medidor_url(@medidor)
    assert_response :success
  end

  test "should get edit" do
    get edit_medidor_url(@medidor)
    assert_response :success
  end

  test "should update medidor" do
    patch medidor_url(@medidor), params: { medidor: { estado_medidor: @medidor.estado_medidor, medicion: @medidor.medicion, numero: @medidor.numero } }
    assert_redirected_to medidor_url(@medidor)
  end

  test "should destroy medidor" do
    assert_difference('Medidor.count', -1) do
      delete medidor_url(@medidor)
    end

    assert_redirected_to medidors_url
  end
end
