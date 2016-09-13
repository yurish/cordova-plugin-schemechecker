package org.apache.cordova.plugin;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class Echo extends CordovaPlugin {
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("checkScheme")) {
            String message = args.getString(0);
            this.checkPackage(message, callbackContext);
            return true;
        }
        return false;
    }
    
    private void echo(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }
    
    private void checkPackage(String packageName, CallbackContext callbackContext){
        final PackageManager pm = getApplicationContext().getPackageManager();
        ApplicationInfo ai;
        try {
            ai = pm.getApplicationInfo( packageName, 0);
            callbackContext.success("true");
        } catch (final NameNotFoundException e) {
            callbackContext.success("false");
        }
    }
}