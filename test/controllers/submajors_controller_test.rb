require 'test_helper'

class SubmajorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submajor = submajors(:one)
  end

  test "should get index" do
    get submajors_url
    assert_response :success
  end

  test "should get new" do
    get new_submajor_url
    assert_response :success
  end

  test "should create submajor" do
    assert_difference('Submajor.count') do
      post submajors_url, params: { submajor: { konsentrasi: @submajor.konsentrasi, major_id: @submajor.major_id } }
    end

    assert_redirected_to submajor_url(Submajor.last)
  end

  test "should show submajor" do
    get submajor_url(@submajor)
    assert_response :success
  end

  test "should get edit" do
    get edit_submajor_url(@submajor)
    assert_response :success
  end

  test "should update submajor" do
    patch submajor_url(@submajor), params: { submajor: { konsentrasi: @submajor.konsentrasi, major_id: @submajor.major_id } }
    assert_redirected_to submajor_url(@submajor)
  end

  test "should destroy submajor" do
    assert_difference('Submajor.count', -1) do
      delete submajor_url(@submajor)
    end

    assert_redirected_to submajors_url
  end
end
