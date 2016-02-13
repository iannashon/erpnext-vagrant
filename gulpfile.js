var gulp = require('gulp');
var shell = require('child_process').execSync;
var watcher;

function startWatcher(path) {
    if (! watcher) {
        watcher = gulp.watch('bench/apps/**/*.py', autoreload);
    }
}

function stopWatcher() {
    if (watcher) {
        watcher.end();
        watcher = null;
    }
}

function autoreload(event) {
    console.log('File ' + event.path + ' was ' + event.type + '. Sending reload signal...');
    stopWatcher();
    shell('vagrant ssh -c "touch ' + event.path.replace(__dirname, '/vagrant') + '"');
    startWatcher();
}

gulp.task('watch', function() {
    startWatcher();
});

gulp.task('default', ['watch']);
