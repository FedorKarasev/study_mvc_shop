/**
 * Created by fedor on 22.01.17.
 */
$(document).ready(function () {
    $('.add-to-cart').click(function () {
        var id = $(this).attr('data-id');
        $.post("/cart/addAjax/"+id, {}, function (data) {
            $('#cart-count').html('('+data+')');
        });
    });
});