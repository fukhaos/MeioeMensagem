//
//  LoginViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 24/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKCoreKit
import FacebookCore



class LoginViewController: UIViewController {
  

    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var viewEntrar: UIView!
    @IBOutlet weak var viewFacebook: UIView!
    @IBOutlet weak var viewLinkedin: UIView!
    @IBOutlet weak var novoCadastro: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //Arredonda os cantos das UIView
        self.viewEntrar.layer.cornerRadius = 20
        self.viewFacebook.layer.cornerRadius = 30
        self.viewLinkedin.layer.cornerRadius = 30
        
      

        // Recolhe o teclado ao tocar na tela.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
     
        
        //Inicializando o botão com o recebimento da Func setUIElements
        self.novoCadastro.setAttributedTitle(setUIElements(), for: .normal)
        
    }
    
    //Object-C para recolher teclado.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func signIn(_ sender: Any) {
    
    }
    
    
    //Func para incluir texto no botão de novo cadastro e criar um hiperlink.
    func setUIElements()  -> NSMutableAttributedString{
        let attributedString = NSMutableAttributedString(string: "Ainda não tem conta? Faça seu cadastro.", attributes: [
            .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
            .foregroundColor: UIColor(white: 36.0 / 255.0, alpha: 1.0)
            ])
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14.0, weight: .bold), range: NSRange(location: 21, length: 18))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0/255, green: 96/255, blue: 152/255, alpha: 1), range: NSRange(location: 21, length: 18))
        novoCadastro.setAttributedTitle(attributedString, for: .normal)
        return attributedString
        
    }
    
//
//    @IBAction func loginWithFacebook(_ sender: Any) {
//        let manager = LoginManager()
//        manager.logIn(permissions: [.publicProfile, .email], viewController: self) { (result) in
//            switch result {
//            case .cancelled:
//                print("User cancelled login process")
//                break
//            case .failed(let error) :
//                print("Login failed with error \(error.localizedDescription)")
//                break
//            case .success(let grantedPermissions, let _, let accessToken):
//                print("access token == \(accessToken)")
//                self.performSegue(withIdentifier: "segueSingup", sender: nil)
//            }
//
//        }
//
//    }
    
  
    //Segue Forgot Password
    
    @IBAction func forgotPass(_ sender: Any) {
        self.performSegue(withIdentifier: "segueForgotPass", sender: nil)
    }
    
    @IBAction func cadastroNew(_ sender: Any) {
        
        self.performSegue(withIdentifier: "segueSingup", sender: nil)
    }
    
    
    @IBAction func cadastroButton(_ sender: UIButton) {
        
        if emailTextField.text == "" || senhaTextField.text == ""{
            let alerta = UIAlertController(title: "Alerta", message: "Os campos E-mail e Senha devem ser preenchidos", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        }else if !(self.emailTextField.text?.isValidEmail() ?? true) {
            let alerta = UIAlertController(title: "Alerta", message: "E-mail invalido, favor verificar.", preferredStyle: .alert)
            let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(bntOk)
            present(alerta, animated: true, completion: nil)
        }else {
            self.performSegue(withIdentifier: "segueLoginOk", sender: nil)
        }
        
    }
    
    @IBAction func closedLoginPage(_ sender: Any) {
     self.performSegue(withIdentifier: "goMain", sender: nil)
   
    }
    
    
}


    


