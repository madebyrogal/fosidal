(function ($) {
    $.fn.quiz = function (option) {
        var container = $(this);
        var elems = container.find('li');
        var nextButton = $('#nextQuestion');
        var url = container.data('url');
        toogleNextButton();
        var data = {
            'questionNr': container.data('question'),
            'token': container.data('token')
        }

        function checkAnswer() {
            var selectedAnswer = $(this);
            data.answerNr = $(this).data('answer');
            selectedAnswer.addClass('active');
            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                success: function (response) {
                    if (data.answerNr === response.answerId) {
                        toogleClasses(true, selectedAnswer)
                    } else {
                        toogleClasses(false, selectedAnswer, response.answerId)
                    }
                    toogleNextButton('enabled');
                    disablePlugin();
                },
                error: function(response){
                    window.location.href = response.responseJSON.url;
                }
            });
        }

        function toogleClasses(correct, elem, answerId) {
            answerId = answerId || 0;
            if (correct) {
                elem.removeClass('active');
                elem.find('.boxLetter span').empty();
                elem.addClass('ok');
            } else {
                elem.removeClass('active').find('.boxLetter span').empty()
                elem.addClass('error');
                var correctAnswer = container.find('li[data-answer="' + answerId + '"]');
                correctAnswer.find('.boxLetter span').empty();
                correctAnswer.addClass('ok');
            }
        }
        
        function toogleNextButton(status){
            status = status || 'disabled';
            
            if(status === 'enabled'){
                nextButton.removeClass('disabled');
                nextButton.unbind('click');
            } else {
                nextButton.on('click', function(e){
                    e.preventDefault();
                });
                nextButton.addClass('disabled');
            }
        }

        function disablePlugin() {
            elems.each(function () {
                $(this).unbind('click');
            });
        }


        return elems.each(function () {
            $(this).on('click', checkAnswer);
        });
    }
})(jQuery);

$(document).ready(function () {

});