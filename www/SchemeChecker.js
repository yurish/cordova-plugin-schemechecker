var exec = require('cordova/exec');

exports.checkScheme = function(arg0, success, error) {
    exec(success, error, "SchemeChecker", "checkScheme", [arg0]);
};
