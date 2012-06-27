$(document).ready(function () {

    function new_review_submitted() {
        console.log('done');
    }
    
    $.get($('#new_review_url').attr('href'),
          function (resp) {
              $('#new_review').html(resp);
              // Tell the new review form what snippet it's for
              // TODO: I'm sure it's not the right way to do this
              $('#review_snippet_id').val($('#snippet_id').val());
              util.ajaxify_forms('#new_review', new_review_submitted);
          });


    prettyPrint();
});