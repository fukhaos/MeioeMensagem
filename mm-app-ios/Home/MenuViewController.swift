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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        
        //Encaminha para a pagina selecionada no SlideBar
        switch menuType {
        case .notificacao:
         self.performSegue(withIdentifier: "notificacao", sender: nil)
        case .preferencia:
            self.performSegue(withIdentifier: "preferencia", sender: nil)
            break
            
        case .meusDownloads:
            dismiss(animated: true) { [weak self] in
                print("Dismissing: \(menuType)")
                self?.didTapMenuType?(menuType)
            }
        
        case .salvo:
            dismiss(animated: true) { [weak self] in
                print("Dismissing: \(menuType)")
                self?.didTapMenuType?(menuType)
            }
        case .avaliarApp:
            dismiss(animated: true) { [weak self] in
                print("Dismissing: \(menuType)")
                self?.didTapMenuType?(menuType)
            }
        case .tutorial:
            self.performSegue(withIdentifier: "tutorial", sender: nil)
            
        case .faleConosco:
            self.performSegue(withIdentifier: "segueFaleConosco", sender: nil)
            //dismiss(animated: true) { [weak self] in
            //    print("Dismissing: \(menuType)")
            //    self?.didTapMenuType?(menuType)
            //}
        case .faq:
            dismiss(animated: true) { [weak self] in
                print("Dismissing: \(menuType)")
                self?.didTapMenuType?(menuType)
            }
        case .politicaPrivacidade:
            dismiss(animated: true) { [weak self] in
                print("Dismissing: \(menuType)")
                self?.didTapMenuType?(menuType)
            }
        case .sair:
            dismiss(animated: true) { [weak self] in
                print("Dismissing: \(menuType)")
                self?.didTapMenuType?(menuType)                
            }
        
        }
        
    }
    
    @IBAction func segueStory(_ sender: Any) {
        self.performSegue(withIdentifier: "goMain", sender: nil)
    }
    
    
}
