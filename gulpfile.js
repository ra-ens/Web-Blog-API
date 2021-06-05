/**
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
 */

var gulp 	= require('gulp'),
	coffee 	= require('gulp-coffeescript'),
	del 	= require('del');

/**
 * Compile coffeeScript files under source directory
*/
function coffeeTask(cb) {
	gulp.src('./src/**/*.coffee')
		.pipe(coffee({bare: true}))
		.pipe(gulp.dest('./dist/'));
	cb();
}

/**
 * Clean project build files
 */
function clean(cb) {
	(async function() {
		await del(['./dist']);
	})();

	cb();
}

/**
 * Watch modified files
 */
function watch() {
	gulp.watch('./src/**/*.coffee', coffeeTask);
}

var build = gulp.parallel(coffeeTask);

exports.default = gulp.series(build, watch);
exports.clean = clean;