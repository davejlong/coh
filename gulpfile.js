'use strict';

var gulp = require("gulp"),
    imagemin = require("gulp-imagemin"),
    jshint = require("gulp-jshint"),
    sass = require("gulp-sass"),
    sourcemaps = require("gulp-sourcemaps"),
    uglify = require("gulp-uglify");

var apps = ["web", "admin"];

function stylesheetTask (src, dest) {
  return gulp.src(src)
    .pipe(sourcemaps.init())
    .pipe(sass({
      includePaths: ["lib/vendor/assets/foundation/scss"]
    }).on("error", sass.logError))
  .pipe(sourcemaps.write())
  .pipe(gulp.dest(dest));
}
gulp.task("stylesheets:global", function () {
  stylesheetTask("./lib/public/stylesheets/src/**/*.scss", "./lib/public/stylesheets");
});

apps.forEach(function (app) {
  gulp.task("stylesheets:" + app, function () {
    stylesheetTask("./apps/" + app + "/public/stylesheets/src/**/*.scss", "./apps/" + app + "/public/stylesheets")
  });
});

gulp.task("stylesheets:watch", function () {
  gulp.watch("./lib/public/stylesheets/src/**/*.scss", ["stylesheets:global"]);
  apps.forEach(function (app) {
    gulp.watch("./apps/" + app + "/public/stylesheets/src/**/*.scss", ["stylesheets:" + app]);
  });
});

gulp.task("default", ["stylesheets:watch"]);
