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
        watch = require('gulp-watch');

gulp.task('less', function () {
    return gulp.src('web/assets/less/*.less')
            .pipe(plumber())
            .pipe(less())
            .on('error', function (error) {
                // Would like to catch the error here
                console.log(error);
                this.emit('end');
            })
            .pipe(gulp.dest('web/assets/css'));
});

// Watch Files For Changes
gulp.task('watch', function () {
    gulp.watch('web/assets/less/**/*.less', ['less']);
});

gulp.task('minifyCSS', function () {
    gulp.src([
        '.web/assets/css/*.css'
    ])
            .pipe(concat('style.min.css'))
            .pipe(minifyCSS())
            .pipe(gulp.dest('web/assets/dist'));
});
// define tasks here
gulp.task('default', ['less', 'minifyCSS', 'watch']);

