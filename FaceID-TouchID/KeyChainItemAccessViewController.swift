//
//  KeyChainItemAccessViewController.swift
//  FaceID-TouchID
//
//  Created by Heshan Yodagama on 4/23/20.
//  Copyright © 2020 Heshan Yodagama. All rights reserved.
//

import UIKit

class KeyChainItemAccessViewController: UIViewController {

    struct Credentials{
        var userName: String
        var password: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addCredentials(_ credentials: Credentials, server: String) {
        let accsess = SecAccessControlCreateWithFlags(nil,//use default allocator
            kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
            .userPresence,
            nil)//ignore any error
    }

}
