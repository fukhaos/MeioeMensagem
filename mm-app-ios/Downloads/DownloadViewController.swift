//
//  DownloadViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 12/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class DownloadViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    let defaults = UserDefaults.standard
    
    
    let noticiasSecundarias = ["McDonald`s muda pelo gosto do consumidor", "McDonald`s muda pelo gosto do consumidor", "McDonald`s muda pelo gosto do consumidor"]
    let noticiasImagens: [UIImage] = [
        UIImage(named: "shopping-cidade-jardim.jpg")!,
        UIImage(named: "McDonalds.jpg")!,
        UIImage(named: "BurguerKing.png")!,
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

//        collectionView.dataSource = self
//        collectionView.delegate = self
        
//        //Layout Manual da CollectionView
//        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
//        layout.minimumInteritemSpacing = 5
//        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: self.collectionView.frame.size.height/1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noticiasSecundarias.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = UIColor.white
        cell.labelDescrisaoSec.text = noticiasSecundarias[indexPath.item]
        cell.labelDescrisaoSec.textColor = UIColor.white
        cell.materiaSec.image = noticiasImagens[indexPath.item]
        cell.layer.borderColor = UIColor.white.cgColor
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
    
    
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "segueMenu", sender: nil)
    }
    

}
