$(document).ready(function () {

    var signup = $('#signup_url').val(),
    login = $('#login_url').val();

    function load_content(sel) {
        return function (resp) {
            $(sel).html(resp);
            util.ajaxify_forms(sel);
        };
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