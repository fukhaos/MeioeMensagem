//
//  ForgotPassViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 31/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class ForgotPassViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var viewSendPass: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewSendPass.layer.cornerRadius = 19
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func forgotPassButton(_ sender: Any) {
        
        if emailTextField.text == ""{
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo e-mail", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        }else if !(emailTextField.text?.isValidEmail() ?? true) {
            let alerta = UIAlertController(title: "Alerta", message: "Email inválido", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        }else  {
            self.performSegue(withIdentifier: "segueResendEmail", sender: nil)
        }
        
        
    }
    

}
