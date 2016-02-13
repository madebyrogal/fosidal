(function ($) {
    $.fn.quiz = function (option) {
        //Main container
        var container = $(this);
        //Answer element
        var elems = container.find('li');
        //Button to next question
        var nextButton = $('#nextQuestion');
        //Visual of timer
        var countdown = $(".countdown");
        //Time to answer
        var time = parseInt(container.data('time'));
        var timerHandler;
        //Url to check data
        var url = container.data('url');
        //Point for question
        var point = parseInt(container.data('point'));
        //Points assume
        var points = parseInt(container.data('points'));

        //If initial
        if (elems.length) {
            toogleNextButton();
            timerStart();
        }
        
        var data = {
            'questionNr': container.data('question'),
            'token': container.data('token')
        }

        function selectAnswer() {
            elems.removeClass('active');
            $(this).addClass('active');
            toogleNextButton('enabled');
        }

        function checkAnswer() {
            timerStop();
            var selectedAnswer = 0;
            elems.each(function (i, elem) {
                if ($(elem).hasClass('active')) {
                    selectedAnswer = $(elem);
                    return;
                }
            });
            data.answerNr = selectedAnswer.data('answer');

            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                success: function (response) {
                    if (data.answerNr === response.answerId) {
                        toogleClasses(true, selectedAnswer)
                        //Add points
                        addPoints();
                    } else {
                        toogleClasses(false, selectedAnswer, response.answerId)
                    }
                    //toogleNextButton('enabled');
                    disablePlugin();
                    setTimeout(moveToNextQuestion, 1000);
                },
                error: function (response) {
                    window.location.href = response.responseJSON.url;
                }
            });
        }

        function sendFakeAnswer() {
            data.timeLeft = 0;
            data.answerNr = 0;
            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                success: function (response) {
                    moveToNextQuestion();
                },
                error: function (response) {
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

        function addPoints() {
            var newPoints = points + point;
            $('#pointAssume').html(newPoints);
        }

        function toogleNextButton(status) {
            status = status || 'disabled';

            if (status === 'enabled') {
                nextButton.removeClass('disabled');
                nextButton.unbind('click');
                nextButton.on('click', function (e) {
                    e.preventDefault();
                    checkAnswer();
                });
            } else {
                nextButton.on('click', function (e) {
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

        function timerStart() {
            timerHandler = setInterval(countDown, 1000)
        }

        function countDown() {
            if (time > 0) {
                time--;
                displayCountDown(time);
            } else {
                timerStop();
                disablePlugin();
                sendFakeAnswer();
            }
        }

        function displayCountDown(timeToDisplay) {
            var min = sprintf("%02d", Math.floor(timeToDisplay) / 60);
            var sec = sprintf("%02d", timeToDisplay % 60);
            timeToDisplay = min + ':' + sec;
            countdown.html(timeToDisplay);
        }

        function timerStop() {
            clearInterval(timerHandler);
            data.timeLeft = time;
        }

        function moveToNextQuestion() {
            var urlNext = nextButton.parent().attr('href');
            window.location.href = urlNext;
        }

        return elems.each(function (i, elem) {
            $(this).on('click', selectAnswer);
        });
    }
})(jQuery);