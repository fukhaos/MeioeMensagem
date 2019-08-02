//
//  PreferAndConfigViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 01/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit



class PreferAndConfigViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }
    

    @IBAction func backMain(_ sender: Any) {
        self.performSegue(withIdentifier: "segueMain", sender: nil)
        
    }
    

}

