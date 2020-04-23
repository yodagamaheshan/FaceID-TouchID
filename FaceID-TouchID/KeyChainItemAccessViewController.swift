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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
