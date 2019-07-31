//
//  CadastroViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 25/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit
import SQLite3
import FacebookLogin
import FacebookShare
import FacebookCore
import FBSDKLoginKit





class CadastroViewController: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var CadastrarView: UIView!
    @IBOutlet weak var checkButton: SpringButton!
    @IBOutlet weak var nameTextF: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var nickNameTextF: UITextField!
    @IBOutlet weak var cpfTextF: UITextField!
    @IBOutlet weak var emailTextF: UITextField!
    @IBOutlet weak var alternaEmailTextF: UITextField!
    @IBOutlet weak var passwdTextF: UITextField!
    @IBOutlet weak var confirmaPasswdTextF: UITextField!
    @IBOutlet weak var userAndTermsButton: UIButton!
    

    
    
    
    //MARK: - Properties
    var dataBase : OpaquePointer? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CadastrarView.layer.cornerRadius = 25

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setUIElements() {
        let attributedString = NSMutableAttributedString(string: "Eu li e concordo com os Termos de Uso.", attributes: [
            .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
            .foregroundColor: UIColor(white: 36.0 / 255.0, alpha: 1.0)
            ])
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14.0, weight: .bold), range: NSRange(location: 24, length: 14))
        userAndTermsButton.setAttributedTitle(attributedString, for: .normal)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @IBAction func checkAction(_ sender: Any) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        if checkButton.isSelected {
            checkButton.isSelected = false
        } else {
            checkButton.isSelected = true
            checkButton.animation = "pop"
            checkButton.animate()
        }
    }
        

    private func validateFields() -> String{
        var msg = ""
        let cpf = cpfTextF.text
        
        if self.nameTextF.text == "" {
            msg = "Preencha o campo Nome"
        } else if self.lastNameText.text == "" {
            msg = "Preencha o campo Sobrenome"
        } else if self.nickNameTextF.text == "" {
            msg = "Preencha o campo Apelido"
        } else if self.cpfTextF.text == "" {
            msg = "Preencha o campo CPF"
        }else if self.cpfTextF.text?.count ?? 11 < 11 {
            msg = "O campo CPF deve conter 11 números"
        } else if !(cpf!.isValidCPF) {
            msg = "CPF inválido"
        } else if self.emailTextF.text == "" {
            msg = "Preencha o campo E-mail"
        }else if !(self.emailTextF.text?.isValidEmail() ?? true) {
            msg = "O e-mail não e valído"
        } else if self.passwdTextF.text == "" {
            msg = "Preencha o campo senha"
        } else if self.confirmaPasswdTextF.text == "" {
            msg = "Confirme a senha"
        } else if passwdTextF.text != confirmaPasswdTextF.text {
            msg = "As senhas devem ser iguais"
        } else if !checkButton.isSelected {
            msg = "Aceite os termos de Uso"
        }
        
        return msg
    }
    
    
    
    //MARK: - Action
    @IBAction func cadastroBTN(_ sender: UIButton) {
       let cpf = cpfTextF.text
        
        if self.nameTextF.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo nome", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        } else if self.lastNameText.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Sobrenome", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.nickNameTextF.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Apelido", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
           
        } else if self.cpfTextF.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo CPF.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        }else if self.cpfTextF.text?.count ?? 11 < 11 {
            let alerta = UIAlertController(title: "Alerta", message: "O número do CPF deve conter 11 digitos.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if !(cpf!.isValidCPF) {
            let alerta = UIAlertController(title: "Alerta", message: "CPF Invalido", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.emailTextF.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Email", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        }else if !(self.emailTextF.text?.isValidEmail() ?? true) {
            let alerta = UIAlertController(title: "Alerta", message: "E-mail invalido", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.passwdTextF.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo senha.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.confirmaPasswdTextF.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "preencha o campo Confirma Senha.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if passwdTextF.text != confirmaPasswdTextF.text {
            let alerta = UIAlertController(title: "Alerta", message: "Senhas diferentes, favor verificar.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if !checkButton.isSelected {
            let alerta = UIAlertController(title: "Alerta", message: "Por favor, aceite os termos de uso.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        }else {
            self.shouldPerformSegue(withIdentifier: "segueOk", sender: nil)
        }
     

    }
    
}
