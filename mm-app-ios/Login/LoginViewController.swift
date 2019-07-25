//
//  LoginViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 24/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit
import SQLite3

class LoginViewController: UIViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    @IBOutlet weak var viewEntrar: UIView!
    
    
    //MARK: - Properties
    var dataBase : OpaquePointer? = nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.viewEntrar.layer.cornerRadius = 27
        
        
        //check if the bank exists
        if (FileManager.default.fileExists(atPath: pathArquivo)){
            //If the bank exists, open the bank
            if (sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK){
                
                print("Banco aberto com sucesso")
                
            }
            
            
            //Ig the bank not exists, create a bank
        }else if (sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK){
            print("Banco criado com sucesso")
            
            //Create Table
            let comando = "create table if not exists USER (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nome TEXT, sobrenome TEXT, apelido TEXT, cpfValido INTEGER, email TEXT, emailAlternativo TEXT, senha TEXT, senhaValida TEXT)"
            
            // Função que executa um comando SQLITE sem retorno do banco
            if (sqlite3_exec(dataBase, comando, nil, nil, nil) == SQLITE_OK){
                print("Tabela Criado com sucesso!")
                
            }else {
                print("Erro na criação da tabela")
            }
            
        }else {
            print("Erro na criação do Banco")
            
        }
        
   
        
    }
    
    //MARK: - Actions
    @IBAction func entrarBTN(_ sender: UIButton) {
        let emailDigitado = emailTextField.text
        let senhaDigitada = senhaTextField.text
        
        //Cria o comando para regastar os dados
        let comando = "select * from USER"
        
        //Variavél que armazena o valor gerado pelo select
        var resultado : OpaquePointer? = nil
        
        //Função que executa um comando com retorno do banco
        if (sqlite3_prepare_v2(dataBase, comando, -1, &resultado, nil) == SQLITE_OK){
            //Laço para precorrer todos os registros
            while(sqlite3_step(resultado) == SQLITE_ROW){
                //Resgata das informações
                let numeroUser = sqlite3_column_int(resultado, 0)
                var email = ""
                var senha = ""
                
                if let cEmail = sqlite3_column_text(resultado, 5){
                    email = String(cString: cEmail)
                    
                }
                if let cSenha = sqlite3_column_text(resultado, 6){
                    senha = String(cString: cSenha)
                    
                }
                if (email == emailDigitado) || (senha == senhaDigitada) {
                    let cNome = sqlite3_column_text(resultado, 1)
                    let nome = String(cString: cNome!)
                    let cSenha = sqlite3_column_text(resultado, 2)
                    let senha = String(cString: cSenha!)
 
                    
                    let alerta = UIAlertController(title: "Alerta", message: "Usuário cadastrado com sucesso.", preferredStyle: .alert)
                    let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
                   // let bntCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                    alerta.addAction(bntOk)
                    //alerta.addAction(bntCancel)
                    
                    present(alerta, animated: true, completion: nil)
                    
                } else {
                    print("E-mail não cadastrado")
                    let alerta = UIAlertController(title: "Alerta", message: "Cliente não cadastrado", preferredStyle: .alert)
                    let bntOk = UIAlertAction(title: "OK", style: .default, handler: nil)
                    //let bntCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                    //let bntDestu = UIAlertAction(title: "Destruir", style: .destructive, handler: nil)
                    alerta.addAction(bntOk)
                   // alerta.addAction(bntCancel)
                    
                    present(alerta, animated: true, completion: nil)
                }
                
            }
            
        }
    }

 
    
    
       
  
        
    }


    


    


