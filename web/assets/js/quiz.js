(function ($) {
    $.fn.quiz = function (option) {
        var container = $(this);
        var url = container.data('url')
        var data = {
            'questionNr': container.data('question'),
            'token': container.data('token'),
        }
        var elems = container.find('li');

        function checkAnswer() {
            data.answerNr = $(this).data('answer');
            console.log(data);
            $.ajax({
                url: url,
                type: 'GET',
                data: data
            })
        }


        return elems.each(function () {
            $(this).on('click', checkAnswer);
        });
    }
})(jQuery);

$(document).ready(function () {

});