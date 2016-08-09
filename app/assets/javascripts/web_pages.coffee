$ ->
  $('#newWebPage').on 'shown.bs.modal', () ->
    $('input[type=text]').focus();
