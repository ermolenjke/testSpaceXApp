//
//  MainCollectionViewCellViewModel.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 14.09.2022.
//

import UIKit

protocol MainCollectionViewCellViewModelProtocol {
    var text: String? { get }
    var detailText: String? { get }
}

final class MainCollectionViewCellViewModel: MainCollectionViewCellViewModelProtocol {
    
    // MARK: - Properties
    var text: String?
    var detailText: String?
    
    // MARK: - Init
    init(text: String, detailText: String) {
        self.text = text
        self.detailText = detailText
    }
}

