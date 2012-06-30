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

});