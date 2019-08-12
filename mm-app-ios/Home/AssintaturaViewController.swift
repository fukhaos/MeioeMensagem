//
//  AssintaturaViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 12/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class AssintaturaViewController: UIViewController {
    
    
    @IBOutlet weak var fazerLoginView: UIView!
    @IBOutlet weak var assineView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.assineView.layer.cornerRadius = 19
        self.fazerLoginView.layer.cornerRadius = 19

        
    }
    
    @IBAction func login(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoLogin", sender: nil)
    }
    

    @IBAction func assinatura(_ sender: UIButton) {
        let alerta = UIAlertController(title: "Alerta", message: "Você será encaminhado a pagina de assinatura", preferredStyle: .alert)
        let  bntOk = UIAlertAction(title: "OK", style: .default) { (alert) in
            self.performSegue(withIdentifier: "goLogin", sender: nil)
        }
        let bntCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(bntOk)
        alerta.addAction(bntCancel)
        present(alerta, animated: true, completion: nil)
    }
    
}
