//
//  LightTheme.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 12/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class LightTheme: ThemeProtocol {
    var mainFontName: String = "Roboto"
    var textColor: UIColor = UIColor(named: "BlackText")!
    var textColorInverse: UIColor = UIColor(named: "WhiteText")!
    var placeholderColor: UIColor = .lightGray
    
    var lineColor: UIColor = UIColor(named: "black")!
    
    var background: UIColor = UIColor(named: "WhiteBackground")!
    var backgroundSecondary: UIColor = UIColor(named: "BlueBackground")!
    
    var buttonBackgroundColor: UIColor = UIColor(named: "BlueBackground")!
    var viewBackgroundColor: UIColor = UIColor(named: "WhiteBackground")!
    
    var accent: UIColor = UIColor(named: "red")!
    var tint: UIColor = UIColor(named: "red")!
}
