//
//  String + Extensions.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 29.08.2022.
//

import Foundation


extension String {
    func getFormattedDateString(oldFormat: String, newFormat: String) -> String {
        let stringDateFormatter = DateFormatter()
        stringDateFormatter.dateFormat = oldFormat
        let date = stringDateFormatter.date(from: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = newFormat
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date ?? Date())
    }
}
