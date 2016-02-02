$(document).ready(function () {
    scaleBar();
    initQuiz();
    toogleMenu();
});

$(window).resize(function () {
    scaleBar();
});

//Scale bar with fosidal (product)
function scaleBar()
{
    var barBox = $('.barBox');
    var product = $('.barBox .product');
    barBox.find('.side').each(function (i, elem) {
        var width = ($(document).width() - product.width()) / 2
        $(elem).width(width);
    })
}

function initQuiz()
{
    $('.questions').quiz();
}

function toogleMenu(){
    $('#mobileMenu').on('click', function(){
       $('#menu').toggleClass('in'); 
    });
}