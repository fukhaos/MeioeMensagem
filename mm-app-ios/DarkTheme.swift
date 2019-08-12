//
//  DarkTheme.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 12/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class DarkTheme: ThemeProtocol {
    var mainFontName: String = "verdana"
    var textColor: UIColor = UIColor(named: "WhiteText")!
    var textColorInverse: UIColor = UIColor(named: "BlackText")!
    var placeholderColor: UIColor = .white
    
    var lineColor: UIColor = UIColor(named: "WhiteText")!
    
    var background: UIColor = UIColor(named: "BlackBackground")!
    var backgroundSecondary: UIColor = UIColor(named: "GrayBackground")!
    
    var buttonBackgroundColor: UIColor = UIColor(named: "BlueBackground")!
    var viewBackgroundColor: UIColor = UIColor(named: "BlackBackground")!
    
    var tint: UIColor = UIColor(named: "white")!
    var accent: UIColor = UIColor(named: "BlackBackground")!
}
