//
//  UILabel + Extensions.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 12.08.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.textColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
