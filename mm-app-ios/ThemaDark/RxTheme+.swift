////
////  RxTheme+.swift
////  mm-app-ios
////
////  Created by Megaleios DEV on 30/07/19.
////  Copyright © 2019 Megaleios DEV. All rights reserved.
////
//
//import Foundation
//import RxSwift
//import RxCocoa
//import RxTheme
//
//
//// Simple example
////
//// themedClass: UIButton
//// themable: borderColor
//// themableType: CGColor
//// themed: button
////
//
//extension Reactive where Base: UIButton {
//    var borderColor: Binder<CGColor?> {
//        return Binder(self.base) { button, borderColor in
//            button.layer.borderColor = borderColor
//        }
//    }
//}
//
//extension ThemeProxy where Base: UIButton {
//    var borderColor: Observable<CGColor?> {
//        get { return .empty() }
//        set {
//            let disposable = newValue
//                .takeUntil(base.rx.deallocating)
//                .observeOn(MainScheduler.instance)
//                .bind(to: base.rx.borderColor)
//            hold(disposable, for: "borderColor")
//        }
//    }
//}
