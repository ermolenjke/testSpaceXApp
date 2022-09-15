//
//  MainButtonSectionViewModel.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 14.09.2022.
//

final class MainButtonSectionViewModel: MainSectionViewModelProtocol {
    
    // MARK: - Properties
    var name: MainSectionType {
        .button
    }
    
    // an empty cell
    var cells: [MainTableViewCellViewModelProtocol] {
        [MainTableViewCellViewModel()]
    }
}

