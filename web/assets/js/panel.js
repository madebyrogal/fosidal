$(document).ready(function () {
    initTinyMCE();
});


function initTinyMCE() {
    tinymce.init({
        selector: '.tinyMCE',
        menubar: false
    });
}
