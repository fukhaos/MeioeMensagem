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
    @IBOutlet weak var testeButtoon: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //Arredonda os cantos do botão Entrar
        self.viewEntrar.layer.cornerRadius = 20
        
        //Arredonda a View inteira.
        self.testeButtoon.layer.cornerRadius = 40
        
        if AccessToken.isCurrentAccessTokenActive {
            var nome = AccessToken.current?.userID
            performSegue(withIdentifier: "segueDash", sender: nome)
            
        }else {
            print("Usuário não conectado.")
        }

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
     
    }
    
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
    
    @IBAction func loginWithFacebook(_ sender: Any) {
        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile, .email], viewController: self) { (result) in
            switch result {
            case .cancelled:
                print("User cancelled login process")
                break
            case .failed(let error) :
                print("Login failed with error \(error.localizedDescription)")
                break
            case .success(let grantedPermissions, let _, let accessToken):
                print("access token == \(accessToken)")
                self.performSegue(withIdentifier: "segueSingup", sender: nil)
            }
            
        }
        
    }
    
    private func validateFields() -> String {
        
        var msg = ""
        
        if self.emailTextField.text == "" {
            msg = "Preencha o email"
        } else if self.senhaTextField.text == "" {
            msg = "Preencha a senha"
        }
        
        return msg
    }
    
    
    //Segue Forgot Password
    
    @IBAction func forgotPass(_ sender: Any) {
        self.performSegue(withIdentifier: "segueForgotPass", sender: nil)
    }
    
    @IBAction func cadastroNew(_ sender: Any) {
        
        self.performSegue(withIdentifier: "segueSingup", sender: nil)
    }
    
    

    

    

    
    
    
       
  
        
}


    


