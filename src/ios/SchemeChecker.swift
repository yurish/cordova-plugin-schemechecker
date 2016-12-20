@objc(SchemeChecker) class SchemeChecker : CDVPlugin {
  func checkScheme(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    let scheme = command.arguments[0] as? String ?? ""

    if scheme.characters.count > 0 {
        let result = UIApplication.shared.canOpenURL(URL(string:scheme)!);


      pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAs: String(result)
      )
    }

    self.commandDelegate!.send(
      pluginResult, 
      callbackId: command.callbackId
    )
  }
}
