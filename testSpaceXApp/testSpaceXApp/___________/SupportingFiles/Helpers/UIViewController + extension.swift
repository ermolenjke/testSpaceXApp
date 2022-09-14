//
//  UIViewController + extension.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 12.09.2022.
//

import UIKit

extension UIViewController {
    var navigationBarHeight: CGFloat {
        return navigationController?.navigationBar.frame.height ?? 0.0
    }
    
    var bottomSafeAreaHeight: CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0
    }
}

