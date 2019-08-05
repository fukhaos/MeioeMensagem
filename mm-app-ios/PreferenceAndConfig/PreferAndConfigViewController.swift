//
//  PreferAndConfigViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 01/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit


class PreferAndConfigViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Recolhe o teclado ao tocar na tela.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

     
    }
    

    
    //Object-C para recolher o teclado ao tocar na tela.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    
    
    @IBAction func backMain(_ sender: UIBarButtonItem) {
      self.performSegue(withIdentifier: "segueMenu", sender: nil)

 
    }
    
    
    
}


