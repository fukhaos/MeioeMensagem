//
//  DownloadViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 12/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

struct Item {
    var imageName: String
}

class DownloadViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Item] = [Item(imageName: "Materia1"),
                         Item(imageName: "shopping-cidade-jardim.jpg"),
                         Item(imageName: "Materia2"),
                        Item(imageName: "streming.jpg")]
    let noticia = ["McDonald`s muda pelo gosto do consumidor", "McDonald`s muda pelo gosto do consumidor", "McDonald`s muda pelo gosto do consumidor", "McDonald`s muda pelo gosto do consumidor"]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
   // let cellIdentdentifier = "DownloadsCollectionViewCell"
    let cellIdentifier = "DownloadsCollectionViewCell"
    
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "DownloadsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)

    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemForRow: CGFloat = 1.1
            let lineSpacing: CGFloat = 1
            let interInterSpacing: CGFloat = 0.5
            
//            let width = (collectionView.frame.width - (numberOfItemForRow - 1) * interInterSpacing) / numberOfItemForRow
//            let height = width
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 5), height: self.collectionView.frame.size.height/1)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
            collectionViewFlowLayout.scrollDirection = .horizontal
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interInterSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DownloadsCollectionViewCell
        
        cell.noticias.text = noticia[indexPath.item]
        cell.imagens.image = UIImage(named: items[indexPath.item].imageName)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt: \(indexPath)")
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goMain", sender: nil)
    }
    
}

