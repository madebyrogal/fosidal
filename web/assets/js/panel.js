$(document).ready(function () {
    initTinyMCE();
    changeEditionInResult();
});

function changeEditionInResult(){
    $('#quizeEdition').change(function(){
       var uri = $('#adminResultIndexURL').val();
       window.location.href = uri + '/'+ $(this).val();
    });
}

function initTinyMCE() {
    tinymce.init({
        selector: '.tinyMCE',
        menubar: false
    });
}
