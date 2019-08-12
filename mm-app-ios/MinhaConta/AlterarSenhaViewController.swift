//
//  AlterarSenhaViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 06/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class AlterarSenhaViewController: UIViewController {

    @IBOutlet weak var salvarView: UIView!
    @IBOutlet weak var senhaAtualTextField: UITextField!
    @IBOutlet weak var newPasswdTextField: UITextField!
    @IBOutlet weak var confirNewPasswdTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.salvarView.layer.cornerRadius = 25
        
    }
    

    @IBAction func backConta(_ sender: UIBarButtonItem) {
        if ((self.presentingViewController) != nil){
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func salvoInfo(_ sender: UIButton) {
        
        if senhaAtualTextField.text == ""{
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Senha Atual", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)

        } else if newPasswdTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Nova Senha ", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)

        } else if confirNewPasswdTextField.text == ""{
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Confirmar nova senha.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        }else if newPasswdTextField.text != confirNewPasswdTextField.text {
            let alerta = UIAlertController(title: "Alerta", message: "Senhas diferentes, favor digitar a mesma senha nos campos Nova Senha e Confirmar nova senha.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        } else {
            let alerta = UIAlertController(title: "Alerta", message: "Senha alterada com sucesso", preferredStyle: .alert)
            let bntOK = UIAlertAction(title: "OK", style: .default) { (alert) in
                if ((self.presentingViewController) != nil){
                    self.dismiss(animated: false, completion: nil)
                }
            }
            alerta.addAction(bntOK)
            present(alerta, animated: true, completion: nil)
        }   
    }
    
}
