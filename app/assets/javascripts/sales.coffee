window.write_total_price = () ->
  total = 0
  $(".sub-total").each () ->
    sub_total = parseInt($(this).val())
    total += sub_total

  $("#sales_detail_total_price").text("Rp.#{total}")

window.member_autocomplete = () ->
  # autocomplete for member
  sale_member = $(".sale-member-autocomplete").autocomplete
    minLength: 1
    source: (request, response) ->
      $.ajax
        url: $(".sale-member-autocomplete").data("source")
        dataType: 'json'
        data:
          by_member_name:
            keyword: request.term
        success: (data) ->
          response data
          return
      return
    select: (event, ui) ->
      $(".sale-member-autocomplete").val ui.item.name
      $("#sale_member_id").val "#{ui.item.id}"
      false
    response: (event, ui) ->
      # $("#sample_owner_not_found").remove()
      # if ui.content.length is 0
        # $(".sale-member-autocomplete").after "<div id='sample_owner_not_found' class='help-block'><span class='text-danger'>owner not found</span></div>"
        # $("#sample_owner_id").val ""
      # else
        # $("sample_owner_not_found").remove()
      return

  # owner autocomplete menu formater
  unless sale_member.data("ui-autocomplete") is undefined
    sale_member.data("ui-autocomplete")._renderItem = (ul, item) ->
      content = "#{item.name}, #{item.id}"
      $("<li>").append("<a>" + content + "</a>").appendTo ul

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
  member_autocomplete()

  # secara otomatis mencentang/uncentang checkbox jika ada/tidak ada member
  $("body").on "change", ".sale-member-autocomplete", () ->
    any_member = $("#sale_member_autocomplete").val()
    length = any_member.length
    if length > 0
      $("#sale_is_member").attr('checked', true)
    else
      $("#sale_is_member").attr('checked', false)

  $("body").on "change", ".drug-qty", () ->
    len = $(this).data("row")
    qty = $(this).val()
    price = $("#sale_sales_details_attributes_#{len}_price").val()
    sub_total = parseInt(qty)*parseInt(price)
    console.log(price)
    console.log(qty)
    console.log(sub_total)
    $("#sub_total_#{len}").val(sub_total)
    write_total_price()

$(document).on('turbolinks:load', ready);












