//
//  NotificacaoViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 05/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class NotificacaoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backMenu(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "segueMenu", sender: nil)
    }
    

}
