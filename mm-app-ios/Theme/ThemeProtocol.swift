//
//  ThemeProtocol.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 02/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit


protocol ThemeProtocol {
    
    var accent: UIColor { get }
    var textColor: UIColor { get }
    var textColorInCell: UIColor { get }
    var background: UIColor { get }
    var tint: UIColor { get }
}
