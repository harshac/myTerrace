$(document).ready(function(){
    $("input[name='terrace[action]']").on('change', function(){
        var action = $(this).val()
        if(action == 'let'){
            $("#action-form").attr('action', '/terraces/new')
        }
    });
});
