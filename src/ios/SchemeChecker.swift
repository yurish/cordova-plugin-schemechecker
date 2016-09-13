@objc(SchemeChecker) class SchemeChecker : CDVPlugin {
  func checkScheme(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    let scheme = command.arguments[0] as? String ?? ""

    if scheme.characters.count > 0 {
        let result = UIApplication.sharedApplication().canOpenURL(NSURL(string:scheme)!);


      pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAsString: String(result)
      )
    }

    self.commandDelegate!.sendPluginResult(
      pluginResult, 
      callbackId: command.callbackId
    )
  }
}
