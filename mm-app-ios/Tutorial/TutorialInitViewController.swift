//
//  TutorialInitViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 31/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class TutorialInitViewController: UIViewController {
    
    @IBOutlet weak var PrincipalView: UIView!
    
    var indexPath: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    

    
    @IBAction func backMain(_ sender: Any) {
        self.performSegue(withIdentifier: "goMain", sender: nil)
    }
    
}
