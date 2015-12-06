$(document).ready(function() {

    $('#tournament-upload').click(function() {
        var url = $('#tournament-url').val().split('http://')[1],
            subdomain = url.split('.')[0],
            tourney_name = url.split('/')[1],
            api_key = $('#challonge-key-hidden').val();

        var ajaxData = {
            "api_key": api_key,
            "tournament": subdomain + '-' + tourney_name,
            "include_participants": 1,
            "include_matches": 1
        };

        $.ajax({
            url: "https://api.challonge.com/v1/tournaments/"+ajaxData["tournament"]+".json",
            contentType: "application/json",
            dataType: "json",
            data: ajaxData,
            beforeSend: function() {
                $('#tourney-form').toggle();
                $('#fox-waveshine').removeClass('hidden');
            },
            success: function(data) {
                alert("success");
                alert(data["tournament"]["name"]);
                $('#fox-waveshine').addClass('hidden');
            }
        });
    });

});