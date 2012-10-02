;'use strict';

(function($){

$(document).on('pageinit', function(){

    $('#my-upload').on('click', function(e){
        $.mobile.showPageLoadingMsg();
        $('#my-form').upload('/upload', function(data) {
            $.mobile.hidePageLoadingMsg();
            window.alert("アップロードされました！\n"
                + 'テキスト1 : ' + data.text1 + "\n"
                + '画像形式 : ' + data.content_type + "\n"
                + 'サイズ : ' + data.size + "\n"
                + 'ファイル名 : ' + data.basename + "\n");
        }, 'json');

        return false;
    });

});

})(jQuery);
