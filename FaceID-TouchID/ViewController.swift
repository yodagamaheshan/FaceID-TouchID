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
    var contex = LAContext()
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
        if contex.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            evaluate()
        }else{
            print(error)
        }
    }
    
    //3
    func evaluate() {
        let reason = "Log in to your account"
        contex.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
            if success {
                
            } else{
                print(error?.localizedDescription ?? "Failed to authenticate")

                // Fall back to a asking for username and password.
            }
        }
    }
}

