//
//  FAQViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 09/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
        var imagem: [FAQ] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagem = createArray()

        
    
    }
    
    func createArray() -> [FAQ] {
        
        var tempImagem: [FAQ] = []
        
        let imagem1 = FAQ(image: UIImage(named: "go")!, title: "Assinatura")
        let imagem2 = FAQ(image: UIImage(named: "go")!, title: "Aplicativo")
        let imagem3 = FAQ(image: UIImage(named: "go")!, title: "Conta")
        let imagem4 = FAQ(image: UIImage(named: "go")!, title: "Edição avulsa")
        let imagem5 = FAQ(image: UIImage(named: "go")!, title: "Pagamento")
        let imagem6 = FAQ(image: UIImage(named: "go")!, title: "Renovação")
        
        tempImagem.append(imagem1)
        tempImagem.append(imagem2)
        tempImagem.append(imagem3)
        tempImagem.append(imagem4)
        tempImagem.append(imagem5)
        tempImagem.append(imagem6)
        
        return tempImagem


    }
    //MARK: Action
    
    @IBAction func fecharFAQ(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension FAQViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imagens = imagem[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImagemCell") as! FAQTableViewCell
        cell.setImagem(imagem: imagens)
        return cell

    }
    
    
}
