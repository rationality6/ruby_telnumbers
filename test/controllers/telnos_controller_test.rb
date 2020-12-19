require 'test_helper'

class TelnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telno = telnos(:one)
  end

  test "should get index" do
    get telnos_url
    assert_response :success
  end

  test "should get new" do
    get new_telno_url
    assert_response :success
  end

  test "should create telno" do
    assert_difference('Telno.count') do
      post telnos_url, params: { telno: { name: @telno.name, owner: @telno.owner, telno: @telno.telno } }
    end

    assert_redirected_to telno_url(Telno.last)
  end

  test "should show telno" do
    get telno_url(@telno)
    assert_response :success
  end

  test "should get edit" do
    get edit_telno_url(@telno)
    assert_response :success
  end

  test "should update telno" do
    patch telno_url(@telno), params: { telno: { name: @telno.name, owner: @telno.owner, telno: @telno.telno } }
    assert_redirected_to telno_url(@telno)
  end

  test "should destroy telno" do
    assert_difference('Telno.count', -1) do
      delete telno_url(@telno)
    end

    assert_redirected_to telnos_url
  end
end
