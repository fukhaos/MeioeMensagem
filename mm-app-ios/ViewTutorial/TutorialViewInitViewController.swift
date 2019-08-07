//
//  TutorialViewInitViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 02/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class TutorialViewInitViewController: UIViewController {

    
    @IBOutlet weak var goMainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.goMainView.layer.cornerRadius = 25
        
    }
    

    @IBAction func goMainButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segueMain", sender: nil)
    }
    

}
