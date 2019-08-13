//
//  PreferAndConfigViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 01/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit


class PreferAndConfigViewController: UIViewController {
    
    @IBOutlet var ThemeLabels: [UILabel]!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet var ThemeButtons: [UIButton]!
    @IBOutlet weak var darkThemeButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Recolhe o teclado ao tocar na tela.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        darkThemeButton.isOn = (UserDefaults.standard.value(forKey: "StoredTheme") != nil)
        
        applyTheme()
    }
    
    fileprivate func applyTheme() {
        for theme in ThemeLabels {
            theme.applyTheme()
        }
        
        for theme in ThemeButtons {
            theme.applyIcon()
        }
        
        navigationBar.applyTheme()
        viewContainer.backgroundColor = Theme.current.background
        self.view.backgroundColor = Theme.current.backgroundSecondary
    }
    
    
    //Object-C para recolher o teclado ao tocar na tela.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func backMain(_ sender: UIBarButtonItem) {
      self.performSegue(withIdentifier: "segueMenu", sender: nil)
    }
    
    @IBAction func themeSender(_ sender: UISwitch) {
        if sender.isOn {
            Theme.current = DarkTheme()
        } else {
            Theme.current = LightTheme()
        }
        
        UserDefaults.standard.set(sender.isOn, forKey: "StoredTheme")
        
        applyTheme()
    }
}


