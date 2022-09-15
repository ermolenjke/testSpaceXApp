//
//  MainInfoSectionViewModel.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 14.09.2022.
//

import Foundation

final class MainInfoSectionViewModel: MainSectionViewModelProtocol {
    
    // MARK: - Properties
    var name: MainSectionType {
        .info
    }
    
    var cells: [MainTableViewCellViewModelProtocol]
    
    // MARK: - Init
    init(firstFlight: String, country: String, costPerLaunch: Int) {
        
        let firstLaunchCell = MainTableViewCellViewModel(text: .firstFlight,
                                                         detailText: TextFormatter.convertDateFormat(
                                                            date: firstFlight,
                                                            from: .yyyyMMdd,
                                                            to: .MMddyyyy))
        
        let countryCell = MainTableViewCellViewModel(text: .country,
                                                     detailText: country)
        
        let costPerLaunch = MainTableViewCellViewModel(text: .costPerLaunch,
                                                       detailText: TextFormatter.roundNumberWithUnit(costPerLaunch))
        
        let cells = [firstLaunchCell, countryCell, costPerLaunch]
        self.cells = cells
    }
}

