$(document).ready(function(){
    $("input[name='terrace[action]']").on('change', function(){
        var action = $(this).val()
        if(action == 'rent'){
            $("#action-form").attr('action', '/search')
        }
    });
});
