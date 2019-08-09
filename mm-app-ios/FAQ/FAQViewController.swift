//
//  FAQViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 09/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    
    }

    //MARK: Action
    
    @IBAction func fecharFAQ(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goMain", sender: nil)
    }
    

}
