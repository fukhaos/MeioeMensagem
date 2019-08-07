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


class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    let transition = SlideInTransition()
    var topView: UIView?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let noticiasSecundarias = ["McDonald`s muda pelo gosto do consumidor", "McDonald`s muda pelo gosto do consumidor", "McDonald`s muda pelo gosto do consumidor"]
    let noticiasImagens: [UIImage] = [
    UIImage(named: "shopping-cidade-jardim.jpg")!,
    UIImage(named: "McDonalds.jpg")!,
    UIImage(named: "BurguerKing")!,
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //Layout Manual da CollectionView
        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: self.collectionView.frame.size.height/1)
        


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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noticiasSecundarias.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.labelDescrisaoSec.text = noticiasSecundarias[indexPath.item]
        cell.labelDescrisaoSec.textColor = UIColor.white
        cell.materiaSec.image = noticiasImagens[indexPath.item]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
        
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "capaPrincipal", sender: nil)
        } else if indexPath.row == 1 {
            self.performSegue(withIdentifier: "capaPrincipal", sender: nil)
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.black.cgColor
        cell?.layer.borderWidth = 0.5
       
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
