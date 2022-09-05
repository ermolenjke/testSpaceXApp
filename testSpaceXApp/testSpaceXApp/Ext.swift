//
//  Ext.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 05.09.2022.
//

import Foundation
import UIKit

extension NSAttributedString {
    class func setTwoColorsString(str1: String, str2: String = "      ") -> NSMutableAttributedString {
        let atrStr1 = NSMutableAttributedString(string: str1, attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        let atrStr2 = NSMutableAttributedString(string: (" " + str2), attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor.lightGray
        ])
        atrStr1.append(atrStr2)
        return atrStr1
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

