require 'test_helper'

class CtacteclisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ctactecli = ctacteclis(:one)
  end

  test "should get index" do
    get ctacteclis_url
    assert_response :success
  end

  test "should get new" do
    get new_ctactecli_url
    assert_response :success
  end

  test "should create ctactecli" do
    assert_difference('Ctactecli.count') do
      post ctacteclis_url, params: { ctactecli: { cliente_id: @ctactecli.cliente_id, saldo: @ctactecli.saldo } }
    end

    assert_redirected_to ctactecli_url(Ctactecli.last)
  end

  test "should show ctactecli" do
    get ctactecli_url(@ctactecli)
    assert_response :success
  end

  test "should get edit" do
    get edit_ctactecli_url(@ctactecli)
    assert_response :success
  end

  test "should update ctactecli" do
    patch ctactecli_url(@ctactecli), params: { ctactecli: { cliente_id: @ctactecli.cliente_id, saldo: @ctactecli.saldo } }
    assert_redirected_to ctactecli_url(@ctactecli)
  end

  test "should destroy ctactecli" do
    assert_difference('Ctactecli.count', -1) do
      delete ctactecli_url(@ctactecli)
    end

    assert_redirected_to ctacteclis_url
  end
end
