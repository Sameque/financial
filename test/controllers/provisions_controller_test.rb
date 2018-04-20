require 'test_helper'

class ProvisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provision = provisions(:one)
  end

  test "should get index" do
    get provisions_url
    assert_response :success
  end

  test "should get new" do
    get new_provision_url
    assert_response :success
  end

  test "should create provision" do
    assert_difference('Provision.count') do
      post provisions_url, params: { provision: { category_id: @provision.category_id, value: @provision.value } }
    end

    assert_redirected_to provision_url(Provision.last)
  end

  test "should show provision" do
    get provision_url(@provision)
    assert_response :success
  end

  test "should get edit" do
    get edit_provision_url(@provision)
    assert_response :success
  end

  test "should update provision" do
    patch provision_url(@provision), params: { provision: { category_id: @provision.category_id, value: @provision.value } }
    assert_redirected_to provision_url(@provision)
  end

  test "should destroy provision" do
    assert_difference('Provision.count', -1) do
      delete provision_url(@provision)
    end

    assert_redirected_to provisions_url
  end
end
