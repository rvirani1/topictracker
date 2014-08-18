$(document).ready( function() {

//    Markdown Parser
    $("#descriptionarea").markdown({autofocus:false,savable:false});
//    Flash toastr notiications
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    notice = $( "#notice" ).data( "notice" );
    if (notice != undefined ) {
        toastr.info(notice)
    }
    alert = $( "#alert" ).data( "alert" );
    if (alert != undefined ) {
        toastr.warning(alert)
    }

    $('.tag_selector').selectize({
        create: true,
        hideSelected: true,
        allowEmptyOption: true
    });
});

