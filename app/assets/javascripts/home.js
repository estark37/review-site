$(document).ready(function () {

    var signup = $('#signup_url').val(),
    login = $('#login_url').val();

    function ajax(method, url, data, success, failure) {
        $.ajax({
            url: url,
            type: method,
            data: data,
            success: success,
            error: failure
        });
    }

    function load_content(sel) {
        return function (resp) {
            $(sel).html(resp);
            ajaxify_forms(sel);
        };
    }

    function ajaxify_forms(container) {
        $(container).find('form').submit(function (evt) {
            var data = {},
            action = $(this).attr('action'),
            result_container_sel = $(this).attr('data-result-container');

            evt.preventDefault();            
            $(this).find('input').each(function (i, inp) {
                data[$(inp).attr('name')] = $(inp).val();
            });

            ajax('POST',
                 action,
                 data,
                 function (resp) {
                     if (typeof(resp) === 'string') {
                         $(result_container_sel).html(resp);
                         ajaxify_forms(container);
                     } else {
                         if (resp.success) {
                             window.location.replace(resp.redirect);
                         }
                     }
                 },
                 function (err) {
                     $('#ajax_err').show();
                 }
                );

            return false;
        });
    }

    $.get(signup, load_content('#signup'));
    $.get(login, load_content('#login'));

    $('#logout').click(function (evt) {
        evt.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'DELETE',
            dataType: 'json',
            success: function (resp) {
                if (resp.success) {
                    window.location.replace(resp.redirect);
                }
            },
            error: function (err) { console.log(err); }
        });
           
        return false;
    });
});