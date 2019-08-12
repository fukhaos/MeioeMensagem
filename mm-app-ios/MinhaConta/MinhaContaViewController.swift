//
//  MinhaContaViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 06/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class MinhaContaViewController: UIViewController {

    @IBOutlet weak var salvarView: UIView!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sobrenomeTextField: UITextField!
    @IBOutlet weak var apelidoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailAlternativoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = "Luis"
        sobrenomeTextField.text = "Ricardo"
        apelidoTextField.text = "Sr"
        
        self.salvarView.layer.cornerRadius = 25
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func chancePasswd(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goPasswd", sender: nil)
    }
    
    @IBAction func goMain(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goMain", sender: nil)
    }
    @IBAction func salvarInfo(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goMain", sender: nil)
    }
 
    @IBAction func salvarInformacoes(_ sender: UIButton) {
        
        let cpf = cpfTextField.text
        
        
        if self.nameTextField.text == ""{
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Nome", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        } else if sobrenomeTextField.text == ""{
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Sobrenome", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        }else if apelidoTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Apelido", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        
        } else if emailTextField.text == ""{
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo E-mail.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
       
        } else if !(emailTextField.text?.isValidEmail() ?? true) {
            let alerta = UIAlertController(title: "Alerta", message: "E-mail inválido, por favor, inserir um e-mail valido.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        } else if emailAlternativoTextField.text == ""{
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo E-mail Alternativo.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        } else if !(emailAlternativoTextField.text?.isValidEmail() ?? true) {
            let alerta = UIAlertController(title: "Alerta", message: "E-mail alternativo inválido, por favor, inserir um e-mail valido.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        } else if !(cpf!.isValidCPF) {
                let alerta = UIAlertController(title: "Alerta", message: "CPF inválido, favor inserir um CPF valido.", preferredStyle: .alert)
                let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
                alerta.addAction(bntOk)
                present(alerta, animated: true, completion: nil)
            
        } else {
            let alerta = UIAlertController(title: "Alerta", message: "Informações salvas com sucesso.", preferredStyle: .alert)
            let bntOK = UIAlertAction(title: "OK", style: .default) { (alert) in
                self.performSegue(withIdentifier: "goMain", sender: nil)
            }
            alerta.addAction(bntOK)
            present(alerta, animated: true, completion: nil)
        }   
        
    }
    
}
