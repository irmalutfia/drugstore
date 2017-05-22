window.write_total_price = () ->
  total = 0
  $(".sub-total").each () ->
    sub_total = parseInt($(this).val())
    total += sub_total

  $("#sales_detail_total_price").text("Rp.#{total}")

window.drug_autocomplete = () ->
  # autocomplete for drugs
  sale_drug = $(".drug-autocomplete").autocomplete
    minLength: 1
    source: (request, response) ->
      $.ajax
        url: $(".drug-autocomplete").data("source")
        dataType: 'json'
        data:
          by_drug_name:
            keyword: request.term
        success: (data) ->
          response data
          return
      return
    select: (event, ui) ->
      $("#drug_autocomplete").val ""
      len = $.now()
      stringTableDrug = ""
      stringTableDrug += "
        <tr class='drug-detail-row-#{len} new-row'>
          <td>
            <input class='form-control ' name='drug_name_#{len}' id='drug_name_#{len}' value='#{ui.item.name}' type='text' disabled>
            <a href='#' id='remove_drug' data-row='#{len}'>Remove</a>
            <input class='form-control' name='sale[sales_details_attributes][#{len}][drug_id]' value='#{ui.item.id}' id='sale_sales_details_attributes_#{len}_drug_id' type='hidden'>
            <input name='sale[sales_details_attributes][#{len}][id]' id='sale_sales_details_attributes_#{len}_id' type='hidden'>
            <input class='destroy-#{len}' value='false' name='sale[sales_details_attributes][#{len}][_destroy]' id='sale_sales_details_attributes_#{len}__destroy' type='hidden'>
          </td>
          <td>
            <input class='form-control drug-qty' name='sale[sales_details_attributes][#{len}][qty]' data-row='#{len}' value='1' id='sale_sales_details_attributes_#{len}_qty' type='number'>
          </td>
          <td>
            <input class='form-control' name='sale[sales_details_attributes][#{len}][price]' value='#{ui.item.price}' id='sale_sales_details_attributes_#{len}_price' type='number' readonly>
          </td>
          <td class='text-right'>
            <input type='number' class='form-control sub-total' id='sub_total_#{len}' name='sub_total_#{len}' value='#{ui.item.price}' disabled>
          </td>
        </tr>
      "
      $("#drugs_table tbody").append(stringTableDrug)
      write_total_price()
      false
    response: (event, ui) ->
      $("#submission_test_type_not_found").remove()
      if ui.content.length is 0
        # $("#submission_test_type_autocomplete_#{attr_id}").after "<div id='submission_test_type_not_found' class='help-block'><span class='text-danger'>Test type not found</span></div>"
        # $("#sample_test_details_attributes_#{attr_id}_test_type_id").val ""
        # $("#sample_test_details_attributes_#{attr_id}_qty").val ""
        # $("#sample_test_details_attributes_#{attr_id}_price").val ""
        # $("#total_price_#{attr_id}").html ""
      else
        $("submission_test_type_not_found").remove()
      return

  # test type autocomplete menu formater
  unless sale_drug.data("ui-autocomplete") is undefined
    sale_drug.data("ui-autocomplete")._renderItem = (ul, item) ->
      price = parseInt(item.price)
      content = "#{item.name} Rp.#{price}"
      $("<li>").append("<a>" + content + "</a>").appendTo ul
ready = ->
  drug_autocomplete()
  console.log("hello")
# $(document).ready(ready);
$(document).on('turbolinks:load', ready);