# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $('#task_deadline').datepicker({
    format: "yyyy-mm-dd",
    autoclose: true
  });

  $(document).on 'ready page:load', ->
  $(".checkable").click ->
    $(this).parents('form').submit();