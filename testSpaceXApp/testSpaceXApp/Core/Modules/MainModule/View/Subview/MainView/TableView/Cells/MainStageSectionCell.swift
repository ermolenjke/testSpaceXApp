//
//  MainStageSectionCell.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 14.09.2022.
//

import UIKit

private struct MainStageSectionSizeConstants {
    static let mainLabelWidth: CGFloat = (Sizes.screenWidth - Sizes.leftPadding - Sizes.rightPadding) / 1.7
    static let detailsLabelWidth: CGFloat = 80.0
    static let unitLabelWidth: CGFloat = 28.0
    static let labelsHeight: CGFloat = 24.0
    static let spacingBetweenMainAndDetailsLabels: CGFloat = 8.0
    static let spacingBetweenDetailsAndUnitLabels: CGFloat = 4.0
}

final class MainStageSectionCell: UITableViewCell, MainCellProtocol {
    
    // MARK: - Properties
    static let identifier = "stageCell"
    
    var cellViewModel: MainTableViewCellViewModelProtocol? {
        didSet {
            updateLabels()
        }
    }
    
    // MARK: - Subviews
    private let mainLabel: UILabel = {
        $0.font = Fonts.tableViewCellMainLabel.uiFont
        $0.textColor = Colors.tableViewCellMainLabel.uiColor
        $0.textAlignment = .left
        $0.clipsToBounds = true
        $0.adjustsFontSizeToFitWidth = true
        $0.minimumScaleFactor = 0.8
        return $0
    }(UILabel())
    
    private let detailsLabel: UILabel = {
        $0.font = Fonts.tableViewCellDetailsLabel.uiFont
        $0.textColor = Colors.tableViewCellDetailsLabel.uiColor
        $0.textAlignment = .right
        $0.clipsToBounds = true
        $0.adjustsFontSizeToFitWidth = true
        $0.minimumScaleFactor = 0.8
        return $0
    }(UILabel())
    
    private let unitLabel: UILabel = {
        $0.font = Fonts.tableViewCellUnitLabel.uiFont
        $0.textColor = Colors.tableViewCellUnitLabel.uiColor
        $0.textAlignment = .right
        $0.clipsToBounds = true
        return $0
    }(UILabel())
    
    private lazy var subStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailsLabel, unitLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = MainStageSectionSizeConstants.spacingBetweenDetailsAndUnitLabels
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainLabel, subStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = MainStageSectionSizeConstants.spacingBetweenMainAndDetailsLabels
        return stackView
    }()
    
    // MARK: - Init
    private override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureViews() {
        
        contentView.backgroundColor = Colors.tableViewCellBackground.uiColor
        isUserInteractionEnabled = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        let stackViewConstraints = [
            stackView.heightAnchor.constraint(equalToConstant: MainStageSectionSizeConstants.labelsHeight),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Sizes.leftPadding),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -Sizes.rightPadding)
        ]
        
        let mainLabelConstraints = [
            mainLabel.widthAnchor.constraint(equalToConstant: MainStageSectionSizeConstants.mainLabelWidth),
            mainLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        ]
        
        let unitLabelConstraint = unitLabel.widthAnchor.constraint(equalToConstant: MainStageSectionSizeConstants.unitLabelWidth)
        unitLabelConstraint.priority = UILayoutPriority(753)
        let detailsLabelConstraint = detailsLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: MainStageSectionSizeConstants.detailsLabelWidth)
        detailsLabelConstraint.priority = UILayoutPriority(752)
        let subStackViewConstraint = subStackView.widthAnchor.constraint(greaterThanOrEqualTo: stackView.widthAnchor, multiplier: 0.3)
        subStackViewConstraint.priority = UILayoutPriority(751)
        
        NSLayoutConstraint.activate(stackViewConstraints)
        NSLayoutConstraint.activate(mainLabelConstraints)
        NSLayoutConstraint.activate([unitLabelConstraint, detailsLabelConstraint, subStackViewConstraint])
    }
    
    private func updateLabels() {
        guard let viewModel = cellViewModel else { return }
        mainLabel.text = viewModel.text?.rawValue
        detailsLabel.text = viewModel.detailText
        unitLabel.text = viewModel.unit
    }
}
