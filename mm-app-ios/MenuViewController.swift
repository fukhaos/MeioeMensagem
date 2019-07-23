//
//  MenuViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 23/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("Dismissing: \(menuType)")
            
        }
        
        
        
    }
}
