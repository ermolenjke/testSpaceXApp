//
//  MainStageSectionViewModel.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 14.09.2022.
//

private enum UnitType: String {
    case ton = "ton"
    case sec = "sec"
}

final class MainStageSectionViewModel: MainSectionViewModelProtocol {
    
    // MARK: - Properties
    var name: MainSectionType
    var cells: [MainTableViewCellViewModelProtocol]
    
    // MARK: - Init
    init(sectionName: MainSectionType,
         engines: Int,
         fuelAmountTons: Double,
         burnTimeSec: Int?) {
        
        let enginesCell = MainTableViewCellViewModel(text: .engines,
                                                     detailText: String(engines))
        let fuelAmountCell = MainTableViewCellViewModel(text: .fuelAmountTons,
                                                        detailText: String(fuelAmountTons),
                                                        unit: UnitType.ton.rawValue)
        var cells = [enginesCell, fuelAmountCell]
        
        if let burnTimeSec = burnTimeSec {
            let burnTimeCell = MainTableViewCellViewModel(text: .burnTimeSec,
                                                          detailText: String(burnTimeSec),
                                                          unit: UnitType.sec.rawValue)
            cells.append(burnTimeCell)
        }
        
        self.name = sectionName
        self.cells = cells
    }
}

