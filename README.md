# FaceID-TouchID
1.[ ]add -> Privacy - Face ID Usage Description in plist 
The system doesn’t require a comparable usage description for Touch ID.

2.```var context = LAContext()```
You perform biometric authentication in your app using an LAContext instance
You use an authentication context to evaluate the user’s identity, either with biometrics like Touch ID or Face ID, or by supplying the device passcode. The context handles user interaction, and also interfaces to the Secure Enclave, the underlying hardware element that manages biometric data. You create and configure the context, and ask it to carry out the authentication. You then receive an asynchronous callback, which provides an indication of authentication success or failure, and an error instance that explains the reason for a failure, if any.

3.Before attempting to authenticate, test to make sure that you actually have the ability to do so by calling the canEvaluatePolicy(_:error:) method:
```var error: NSError?
if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {```
