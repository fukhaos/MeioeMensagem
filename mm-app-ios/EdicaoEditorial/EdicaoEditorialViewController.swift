//
//  EdicaoEditorialViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 07/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class EdicaoEditorialViewController: UIViewController {

    @IBOutlet weak var avancaMateria: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(EdicaoEditorialViewController.tapFunction))
        avancaMateria.isUserInteractionEnabled = true
        avancaMateria.addGestureRecognizer(tap)
        

        
        
        
    }
    

    
 
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func teste(_ sender: Any) {
        
        print("Passou aqui")
    }
    
    
    

    @IBAction func tapFunction(_ sender: Any) {
        self.performSegue(withIdentifier: "segueMateria", sender: nil)
    }

}
