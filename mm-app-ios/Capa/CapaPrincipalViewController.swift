//
//  CapaPrincipalViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 06/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class CapaPrincipalViewController: UIViewController {
    
    
    @IBOutlet weak var avancarPage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Add tap in label
        let tap = UITapGestureRecognizer(target: self, action: #selector(CapaPrincipalViewController.tapFunction))
        avancarPage.isUserInteractionEnabled = true
        avancarPage.addGestureRecognizer(tap)

    }

    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
    self.performSegue(withIdentifier: "segueEdicao", sender: nil)
    }

    

}
