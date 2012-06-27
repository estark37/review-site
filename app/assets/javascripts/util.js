var util = (function () {

    function ajax(method, url, data, success, failure) {
        $.ajax({
            url: url,
            type: method,
            data: data,
            success: success,
            error: failure
        });
    }

    return {
        ajaxify_forms: function (container, on_submit_done) {
            $(container).find('form').submit(function (evt) {
                var data = {},
                action = $(this).attr('action'),
                result_container_sel = $(this).attr('data-result-container');

                evt.preventDefault();            

                $(this).find('input').each(function (i, inp) {
                    data[$(inp).attr('name')] = $(inp).val();
                });

                $(this).find('textarea').each(function (i, inp) {
                    data[$(inp).attr('name')] = $(inp).val();
                });


                ajax('POST',
                     action,
                     data,
                     function (resp) {
                         if (typeof(resp) === 'string') {
                             $(result_container_sel).html(resp);
                             this.ajaxify_forms(container);
                         } else {
                             if (resp.success) {
                                 if (typeof(on_submit_done) !== 'undefined') {
                                     on_submit_done(resp);
                                 } else if (typeof(resp.redirect) !== 'undefined') {
                                     window.location.replace(resp.redirect);
                                 }
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
    };
}());
