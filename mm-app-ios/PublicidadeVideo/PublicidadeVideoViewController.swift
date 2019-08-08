//
//  PublicidadeVideoViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 08/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class PublicidadeVideoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    let imagemView: [UIImage] = [
        UIImage(named: "shopping-cidade-jardim.jpg")!,
        UIImage(named: "McDonalds.jpg")!,
        UIImage(named: "BurguerKing.png")!,
        UIImage(named: "PublicidadeFoto")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagemView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PublicidadeVideosCollectionViewCell
        
        cell.backgroundColor = UIColor.white
        cell.publicidadeVideos.image = imagemView[indexPath.item]
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
        //Usar as imagens nessa linha.
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.black.cgColor
        cell?.layer.borderWidth = 0.5
        //Faz a desmarcação da celula.
    }
    

}
