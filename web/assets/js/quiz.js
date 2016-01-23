(function ($) {
    $.fn.quiz = function (option) {
        var container = $(this);
        var elems = container.find('li');
        
        function checkAnswer() {
           console.log('click li')
        }
        

        return elems.each(function () {
            $(this).on('click', checkAnswer);
        });
    }
})(jQuery);

$(document).ready(function () {
    
});
