//
//  ThemeProtocol.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 12/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    var mainFontName: String { get }
    var textColor: UIColor { get }
    var textColorInverse: UIColor { get }
    var placeholderColor: UIColor { get }
    
    var lineColor: UIColor { get }
    
    var background: UIColor { get }
    var backgroundSecondary: UIColor { get }
    
    var buttonBackgroundColor: UIColor { get }
    var viewBackgroundColor: UIColor { get }
    
    var accent: UIColor { get }
    var tint: UIColor { get }
}
