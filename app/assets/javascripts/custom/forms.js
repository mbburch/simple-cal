$(document).ready(function() {
    $('input[id=category_color]').minicolors({
      theme: 'bootstrap',
      position: 'bottom right'
    });

    $('#event_active_false').click(function() {
      $('#active-date-field').show();
    });

    $('#event_active_true').click(function() {
      $('#event_active_date').val('');
      $('#active-date-field').hide();
    });

    if ($('#event_active_date').val()) {
      $('#active-date-field').show();
    } else {
      $('#active-date-field').hide();
    }
});