//
//  TutorialInitViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 31/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class TutorialInitViewController: UIViewController {

    @IBOutlet weak var viewEntendi: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewEntendi.layer.cornerRadius = 24
    }
    
    @IBAction func endTutorial(_ sender: Any) {
        self.performSegue(withIdentifier: "segueMain", sender: nil)
    }
    


}
