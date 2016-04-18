var ready = function () {

    $("#bloop_submit").prop("disabled", true);


    $("#bloop_message").on("keydown keyup focus", function () {
        var input_val = $(this).val();
        var parent = $(this).parent();

        if (input_val.trim().length < 1) {
            parent.addClass("field_with_warnings");
            parent.find(".error-message").html("Cannot post an empty Bloop.");
        } else {
            parent.removeClass("field_with_warnings");
            parent.find(".error-message").html("Shoop da Bloop!");
        }
        if ($("#bloop_message").val().length > 2 && $("#bloop_message").val().length < 140) {
            $("#bloop_submit").prop("disabled", false);
        }
        if ($("#bloop_message").val().length > 140 || $("#bloop_message").val().length < 2) {
            $("#bloop_submit").prop("disabled", true);
         }
    });

    $("#new-bloop[data-remote]").on("ajax:success", function (e, data, status, xhr){
        $("#bloop_message").val("");
    });
};

$(document).ready(ready);
$(document).on("page:load", ready);
