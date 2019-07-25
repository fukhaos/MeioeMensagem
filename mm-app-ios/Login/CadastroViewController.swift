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
    

    //MARK: -
    @IBAction func cadastroBTN(_ sender: UIButton) {
        let cpf = cpfTextF.text
        
        if (nameTextF.text!.isEmpty) || (lastNameText.text!.isEmpty) || (cpfTextF.text!.isEmpty) || (emailTextF.text!.isEmpty) || (passwdTextF.text!.isEmpty) || (confirmaPasswdTextF.text!.isEmpty){
            
            let alert = UIAlertController(title: "Atenção", message: "Todos os campos devem ser preenchidos.", preferredStyle: .alert)
            
            let button = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(button)
            
            self.present(alert, animated: true, completion: nil)
            
        }else if (passwdTextF.text) == (confirmaPasswdTextF.text){
            
        }
        
        
        
        
    }
    
}
