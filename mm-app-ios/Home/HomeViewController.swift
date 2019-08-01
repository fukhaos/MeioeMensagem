//
//  ViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 23/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookLogin

class HomeViewController: UIViewController {

    let transition = SlideInTransition()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        var count = Int()
        if count == 0 {
            self.performSegue(withIdentifier: "segueTuto", sender: nil)
            
        }
        count += 1
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return}
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    //Transition Page
    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        
        //Adjust name page
        switch menuType {
        case .notificacao:
            self.title = "Notificações"
        case .preferencia:
            self.title = "Preferência e Configurações"
        case .meusDownloads:
            self.title = "Meus Downloads"
        case .salvo:
            self.title = "Salvos"
        case .avaliarApp:
            self.title = "Avaliar App"
        case .tutorial:
            self.title = "Tutorial"
        case .faleConosco:
            self.title = "Fale Conosco"
        case .faq:
            self.title = "FAQ"
        case .politicaPrivacidade:
            self.title = "Política de Privacidade"
        case .sair:
            self.title = "Sair"
            break
        }
    }
    
    
    

    
    
}

//Add Protocol Transition Delegate
extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
