//
//  PreferAndConfigViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 01/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit


class PreferAndConfigViewController: UIViewController {
    

    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var PrincipalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Recolhe o teclado ao tocar na tela.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    
        //Aplica o Tema Dark na PrincipalView
        applyTheme()
     
    }
    

    
    //Object-C para recolher o teclado ao tocar na tela.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    
    
    @IBAction func backMain(_ sender: UIBarButtonItem) {
      self.performSegue(withIdentifier: "goMain", sender: nil)

 
    }
    
    @IBAction func themeChanged(_ sender: UISwitch) {
        if sender.isOn {
            Theme.current = DarkTheme()
        } else {
            Theme.current = LightTheme()
        }
        
        applyTheme()
    }
    
    fileprivate func applyTheme() {
        view.backgroundColor = Theme.current.background
        PrincipalView.backgroundColor = Theme.current.background
        Label1.backgroundColor = Theme.current.textColor
        Label1.textColor = Theme.current.textColorInCell
        label2.backgroundColor = Theme.current.textColor
        label2.textColor = Theme.current.textColorInCell
        label3.backgroundColor = Theme.current.textColor
        label3.textColor = Theme.current.textColorInCell
        
    }
    
    
}


