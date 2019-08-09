//
//  FAQTableViewCell.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 09/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {

    @IBOutlet weak var labelFAQTableView: UILabel!
    @IBOutlet weak var imageFAQTableView: UIImageView!

    func setImagem(imagem: FAQ) {
        imageFAQTableView.image = imagem.image
        labelFAQTableView.text = imagem.title
    }


}
