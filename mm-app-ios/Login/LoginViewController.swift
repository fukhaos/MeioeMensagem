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
    
    //MARK: - Properties
    var dataBase : OpaquePointer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
            let comando = "create table if not exists CLIENTE (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nome TEXT, cpfValido INTEGER, celular INTEGER, email TEXT, rua TEXT, numero INTEGER, bairro TEXT, uf TEXT, complemento TEXT, cep INTEGER, cidade TEXT)"
            
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

    
}

    


