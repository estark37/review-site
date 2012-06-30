$(document).ready(function () {
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