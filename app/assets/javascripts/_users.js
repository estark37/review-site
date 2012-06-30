$(document).ready(function () {
    util.ajaxify_forms('.user_form', function (resp) {
        if (resp.success) {
            $(".editable").each(function (i, elem) {
                var field = $(elem).attr('data-info'),
                val = $('#edit-' + field).find('input').val();
                $(elem).find('.data').text(val);
                $('#edit-' + field).hide();
                $(elem).show();
            });
        }
    });

    function save() {
        $('.user_form').find('input[type=submit]').click();
    }

    function show_edit(field) {
        $('#show-' + field).hide();
        $('#edit-' + field).show().find('input, textarea').blur(save);
    }

    $('.edit').click(function () {
        show_edit($(this).parents('.editable').attr('data-info'));
    });
});