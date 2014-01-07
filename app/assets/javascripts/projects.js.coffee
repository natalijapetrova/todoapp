# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery.fn.clickCancelButton = ->
    @find('#cancel_button').click ->
        $('#new_project').remove()
        $('#new_link').show()