//
//  LogoutViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 29/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookLogin

class LogoutViewController: UIViewController {
    
    @IBOutlet var logoutWithFacebook: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    self.logoutWithFacebook.layer.cornerRadius = 25
        if AccessToken.current!.isExpired {
            self.performSegue(withIdentifier: "goHome", sender: nil)
            
        }
        
    }
    


}
