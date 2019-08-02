//
//  MenuViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 23/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit


enum MenuType: Int {
    case notificacao
    case preferencia
    case meusDownloads
    case salvo
    case avaliarApp
    case tutorial
    case faleConosco
    case faq
    case politicaPrivacidade
    case sair
}

class MenuViewController: UITableViewController {


    var didTapMenuType: ((MenuType) -> Void)?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        
        //Encaminha para a pagina selecionada no SlideBar
        switch menuType {
        case .preferencia:
            self.performSegue(withIdentifier: "seguePrefeAndConf", sender: nil)
        case .notificacao:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
        case .meusDownloads:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
        case .salvo:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
        case .avaliarApp:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
        case .tutorial:
            self.performSegue(withIdentifier: "tutorial", sender: nil)
        case .faleConosco:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
        case .faq:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
        case .politicaPrivacidade:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
        case .sair:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
            break
        }
        
        //
//        dismiss(animated: true) { [weak self] in
//            print("Dismissing: \(menuType)")
//            self?.didTapMenuType?(menuType)
//
//        }
        
        
        
    }
    
    @IBAction func segueStory(_ sender: Any) {
        self.performSegue(withIdentifier: "segueLogin", sender: nil)
    }
    
    
}
