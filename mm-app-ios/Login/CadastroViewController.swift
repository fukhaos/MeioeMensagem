//
//  CadastroViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 25/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit
import SQLite3


var caminhoParaSandBox = NSHomeDirectory()
var pathDocuments =  (caminhoParaSandBox as NSString).appendingPathComponent("Documents")
var pathArquivo = (pathDocuments as NSString).appendingPathComponent("arquivo.sqlite")


class CadastroViewController: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var CadastrarView: UIView!
    
    @IBOutlet weak var nameTextF: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var nickNameTextF: UITextField!
    @IBOutlet weak var cpfTextF: UITextField!
    @IBOutlet weak var emailTextF: UITextField!
    @IBOutlet weak var alternaEmailTextF: UITextField!
    @IBOutlet weak var passwdTextF: UITextField!
    @IBOutlet weak var confirmaPasswdTextF: UITextField!
    
    //MARK: - Properties
    var dataBase : OpaquePointer? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Arredonda o botão Cadastrar
        self.CadastrarView.layer.cornerRadius = 10

        //Verifica se o banco existe
        if (FileManager.default.fileExists(atPath: pathArquivo)){
            //Caso o banco exista, abre o banco
            if (sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK){
                
                print("Banco aberto com sucesso")
                
            }else {
                print("Erro ao abrir o banco")
            }
            
            
        }
        
        
    }
    

    //MARK: - Action
    @IBAction func cadastroBTN(_ sender: UIButton) {
        let cpf = cpfTextF.text
        
        //Verifica se todos os campos estão preenchidos
        if (nameTextF.text!.isEmpty) || (lastNameText.text!.isEmpty) || (cpfTextF.text!.isEmpty) || (emailTextF.text!.isEmpty) || (passwdTextF.text!.isEmpty) || (confirmaPasswdTextF.text!.isEmpty){
            
            let alert = UIAlertController(title: "Atenção", message: "Todos os campos devem ser preenchidos.", preferredStyle: .alert)
            let button = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        
            //Verifica se as senhas são iguais
        }else if (passwdTextF.text) != (confirmaPasswdTextF.text){
            let alert = UIAlertController(title: "Atenção", message: "As senham não coincidem, favor verificar.", preferredStyle: .alert)
            let button = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
            
            //Verifica a quantidade de digitos no CPF
        }else if (cpfTextF.text!.count < 11) || (cpfTextF.text!.count > 11){
            
            let alert = UIAlertController(title: "Informação", message: "O número do CPF deve conter 11 dígitos, favor verificar o CPF e tentar novamente", preferredStyle: .alert)
            let button = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
            
            //Faz a validação do CPF
        } else if !(cpf!.isValidCPF) {
            print("CPF Invalido")
            let alert = UIAlertController(title: "Informação", message: "Por favor, digitar um CPF valido.", preferredStyle: .alert)
            
            let button = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(button)
            
            self.present(alert, animated: true, completion: nil)

           //Faz a validação do E-mail
        }else if !(emailTextF.text!.isValidEmail()) {
            let alert = UIAlertController(title: "Informação", message: "Favor, digitar um e-mail valido..", preferredStyle: .alert)
            
            let button = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(button)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        //MARK: Salva as informações de login
        
        guard   let nome = nameTextF,
            let sobrenome = lastNameText,
            let apelido = nickNameTextF,
            let cpfValido = cpfTextF.text,
            let email = emailTextF.text,
            let emailAlternativo = alternaEmailTextF.text,
            let senha = passwdTextF.text,
            let senhaValida = confirmaPasswdTextF.text
    
            else{
                print("Algum Dado Inválido")
                return
        }
       
        
        //Criando o comando para salvar
        let comando = "insert into USER values(NULL, '\(nome)', '\(sobrenome)', '\(apelido)', '\(cpfValido)', '\(email)', '\(emailAlternativo), '\(senha), '\(senhaValida)')"
        if (sqlite3_exec(dataBase, comando, nil, nil, nil) == SQLITE_OK){
            print("Registro Criado com Sucesso")
            
            let alert = UIAlertController(title: "Informação", message: "Informações cadastradas com sucesso.", preferredStyle: .alert)
            
            let button = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(button)
            
            self.present(alert, animated: true, completion: nil)
            
            
            
            
        }else {
            //Falha no registro
            print("Falha no registro")
        }
    }
    
}
