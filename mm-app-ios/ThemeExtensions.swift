//
//  ThemeExtensions.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 12/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

extension UIButton {
    func applyTheme() {
        backgroundColor = Theme.current.buttonBackgroundColor
        tintColor = Theme.current.tint
    }
}

extension UILabel {
    func applyTheme() {
        textColor = Theme.current.textColor
        backgroundColor = Theme.current.background
    }
}

extension UITextField {
    func applyTheme() {
        textColor = Theme.current.textColor
        attributedPlaceholder = NSAttributedString(string: "Categoria", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholderColor])
        backgroundColor = Theme.current.background
        layer.borderWidth = 0.5
        layer.borderColor = Theme.current.lineColor.cgColor
    }
}

extension UITextView {
    func applyTheme() {
        backgroundColor = Theme.current.background
        layer.borderWidth = 0.5
        layer.borderColor = Theme.current.lineColor.cgColor
        textColor = .lightGray
    }
}

extension UINavigationBar {
    func applyTheme() {
        barTintColor = Theme.current.backgroundSecondary
    }
}

extension UIView {

}
