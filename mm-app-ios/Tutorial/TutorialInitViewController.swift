//
//  TutorialInitViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 31/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class TutorialInitViewController: UIViewController {
    
    
    var indexPath: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    
    @IBAction func backMain(_ sender: Any) {
        self.performSegue(withIdentifier: "segueMain", sender: nil)
    }
    

}
