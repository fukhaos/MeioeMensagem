//
//  ResendEmailViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 31/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class ResendEmailViewController: UIViewController {

    @IBOutlet weak var ViewResendEmail: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ViewResendEmail.layer.cornerRadius = 25 
        
        
    }
    


    @IBAction func resendPassButton(_ sender: Any) {
        
            let alerta = UIAlertController(title: "Alerta", message: "E-mail reenviado com sucesso.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
        
//        dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
