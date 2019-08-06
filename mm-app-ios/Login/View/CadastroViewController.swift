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
    @IBOutlet weak var userAndTermsButton: UIButton!
    @IBOutlet weak var viewCheck: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var alternaEmailTextField: UITextField!
    @IBOutlet weak var passwdTextField: UITextField!
    @IBOutlet weak var confirmaPasswdTextField: UITextField!
   
    

    
    
    var checkOk = true
    
    //MARK: - Properties
    //var dataBase : OpaquePointer? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Arredando a View Cadastrar
        self.CadastrarView.layer.cornerRadius = 25
        self.viewCheck.layer.cornerRadius = 10
        self.viewCheck.layer.borderWidth = 1
        
        checkOk = false
        
        userAndTermsButton.setBackgroundImage(UIImage(named: "iconCheckoff@2x"), for: .normal)

        
        //Recolhe o teclado ao tocar na tela
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    //Objective-C para recolher teclado ao tocar na tela
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func checkOn() {
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
    
//    @IBAction func checkAction(_ sender: Any) {
//        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//        if checkButton.isSelected {
//            checkButton.isSelected = false
//        } else {
//            checkButton.isSelected = true
//            checkButton.animation = "pop"
//            checkButton.animate()
//        }
//    }
    

//    @IBAction func userAndTermo(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "segueUserAndTermo", sender: nil)
//    }
    
    
    
    
    //MARK: - Action
    @IBAction func cadastroBTN(_ sender: UIButton) {
       let cpf = cpfTextField.text
        
        if self.nameTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo nome", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.lastNameTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Sobrenome", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.nickNameTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Apelido", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
           
        } else if self.cpfTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo CPF.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        }else if self.cpfTextField.text?.count ?? 11 < 11 {
            let alerta = UIAlertController(title: "Alerta", message: "O número do CPF deve conter 11 digitos.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if !(cpf!.isValidCPF) {
            let alerta = UIAlertController(title: "Alerta", message: "CPF Invalido", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.emailTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo Email", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.alternaEmailTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo de confirmação de e-mail", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.emailTextField.text != self.alternaEmailTextField.text {
            let alerta = UIAlertController(title: "Alerta", message: "O Campo e-mail e confirma e-mail são diferentes.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if !(self.emailTextField.text?.isValidEmail() ?? true) {
            let alerta = UIAlertController(title: "Alerta", message: "E-mail invalido", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.passwdTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo senha.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if self.confirmaPasswdTextField.text == "" {
            let alerta = UIAlertController(title: "Alerta", message: "preencha o campo Confirma Senha.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else if passwdTextField.text != confirmaPasswdTextField.text {
            let alerta = UIAlertController(title: "Alerta", message: "Senhas diferentes, favor verificar.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
            
        } else {
            
                self.shouldPerformSegue(withIdentifier: "segueOk", sender: nil)
           
        }
     

    }
    
    //Check Box
    
    @IBAction func checkBox(_ sender: UIButton) {
  
        if !(checkOk) {
            self.userAndTermsButton.setBackgroundImage(UIImage(named: "iconCheckoff@2x"), for: .normal)
            checkOk = true
            
        } else {
            self.userAndTermsButton.setBackgroundImage(UIImage(named: "checkON"), for: .normal)
            checkOk = false
        }
        
        
//        if sender.isSelected == true {
//            self.userAndTermsButton.setBackgroundImage(UIImage(named: "checkON"), for: .normal)
//
//        } else if sender.isSelected == false {
//            self.userAndTermsButton.setBackgroundImage(UIImage(named: "iconCheckoff@2x"), for: .normal)
//
//        }
        
    }
    
    
}
