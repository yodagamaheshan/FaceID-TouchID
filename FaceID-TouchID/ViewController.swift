//
//  ViewController.swift
//  FaceID-TouchID
//
//  Created by Heshan Yodagama on 4/17/20.
//  Copyright © 2020 Heshan Yodagama. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    //1
    var context = LAContext()
    
    /// The available states of being logged in or not.
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    /// The current authentication state.
    var state = AuthenticationState.loggedout {
        
        // Update the UI on a change.
        didSet {
            //TODO:   loginButton.isHighlighted = state == .loggedin  // The button text changes on highlight.
            
            // FaceID runs right away on evaluation, so you might want to warn the user.
            //  In this app, show a special Face ID prompt if the user is logged out, but
            //  only if the device supports that kind of authentication.
            //TODO: faceIDLabel.isHidden = (state == .loggedin) || (context.biometryType != .faceID)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func authenticateButtonTapped(_ sender: Any) {
        testPolicyAvailability()
    }
    
    //2
    func testPolicyAvailability(){
        var error: NSError?
        // Get a fresh context for each login. If you use the same context on multiple attempts
        //  (by commenting out the next line), then a previously successful authentication
        //  causes the next policy evaluation to succeed without testing biometry again.
        //  That's usually not what you want.
        context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            evaluate()
        }else{
            print(error)
            switch error!.code {
            case LAError.biometryNotAvailable.rawValue:
                print(error.debugDescription)
                //Biometry is not available on the device.
            
            case LAError.biometryNotEnrolled.rawValue:
                 print(error.debugDescription)
                //The user has no enrolled biometric identities.
                
                case LAError.biometryLockout.rawValue:
                print(error.debugDescription)
                //Biometry is locked because there were too many failed attempts.
                
            default:
                print(error.debugDescription)
            }
        }
    }
    
    //3
    func evaluate() {
        let reason = "Log in to your account"
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
            if success {
                
            } else{
                print(error?.localizedDescription ?? "Failed to authenticate")
                ViewController.evaluateAuthenticationPolicyMessageForLA(errorCode: error!._code)
                // Fall back to a asking for username and password.
            }
        }
    }
    
    // errorcodes
    class func evaluateAuthenticationPolicyMessageForLA(errorCode: Int){
        print(errorCode)
        var message = ""
        
        switch errorCode {
            
        case LAError.authenticationFailed.rawValue:
            print(errorCode)
        case LAError.appCancel.rawValue:
             print(errorCode)
        case LAError.invalidContext.rawValue:
             print(errorCode)
        case LAError.notInteractive.rawValue:
             print(errorCode)
        case LAError.passcodeNotSet.rawValue:
             print(errorCode)
        case LAError.systemCancel.rawValue:
             print(errorCode)
        case LAError.userCancel.rawValue:
             print(errorCode)
        case LAError.userFallback.rawValue:
             print(errorCode)
        default:
             print(errorCode)
        }
    }
}

