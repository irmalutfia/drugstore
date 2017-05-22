require 'test_helper'

class SalesDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_detail = sales_details(:one)
  end

  test "should get index" do
    get sales_details_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_detail_url
    assert_response :success
  end

  test "should create sales_detail" do
    assert_difference('SalesDetail.count') do
      post sales_details_url, params: { sales_detail: { drug_id: @sales_detail.drug_id, prescription_id: @sales_detail.prescription_id, qty: @sales_detail.qty, sale_id: @sales_detail.sale_id } }
    end

    assert_redirected_to sales_detail_url(SalesDetail.last)
  end

  test "should show sales_detail" do
    get sales_detail_url(@sales_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_detail_url(@sales_detail)
    assert_response :success
  end

  test "should update sales_detail" do
    patch sales_detail_url(@sales_detail), params: { sales_detail: { drug_id: @sales_detail.drug_id, prescription_id: @sales_detail.prescription_id, qty: @sales_detail.qty, sale_id: @sales_detail.sale_id } }
    assert_redirected_to sales_detail_url(@sales_detail)
  end

  test "should destroy sales_detail" do
    assert_difference('SalesDetail.count', -1) do
      delete sales_detail_url(@sales_detail)
    end

    assert_redirected_to sales_details_url
  end
end
