/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var gulp = require('gulp'),
        less = require('gulp-less'),
        minifyCSS = require('gulp-minify-css'),
        plumber = require('gulp-plumber'),
        concat = require('gulp-concat');

gulp.task('less', function () {
    return gulp.src('/web/assets/less/main.less')
            .pipe(plumber())
            .pipe(less({
                paths: ['/web/assets/less']
            }))
            .pipe(gulp.dest('/web/assets/css'));
});

//gulp.task('less', function () {
//    gulp.src('/web/assets/scss/main.scss')
//            .pipe(plumber())
//            .pipe(compass({
//                css: 'web/assets/css',
//                less: 'web/assets/less/main.less',
//            }))
//            .pipe(minifyCSS())
//            .pipe(gulp.dest('web/assets/temp'));
//});

gulp.task('minifyCSS', function () {
    gulp.src([
        './web/assets/css/*.css'
    ])
            .pipe(concat('style.min.css'))
            .pipe(minifyCSS())
            .pipe(gulp.dest('./web/assets/temp'));
});
// define tasks here
gulp.task('default', ['less', 'minifyCSS']);

