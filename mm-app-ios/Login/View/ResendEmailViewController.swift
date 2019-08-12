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
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ViewResendEmail.layer.cornerRadius = 19
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backIndicatorImage = UIImage()
        self.navigationBar.isTranslucent = false
        self.navigationBar.backgroundColor = .white
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


    @IBAction func resendPassButton(_ sender: Any) {
            let alerta = UIAlertController(title: "Alerta", message: "E-mail reenviado com sucesso.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            self.performSegue(withIdentifier: "segueHomeScreen", sender: nil)
            
       
        
    }
    
    @IBAction func closedResendPass(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
