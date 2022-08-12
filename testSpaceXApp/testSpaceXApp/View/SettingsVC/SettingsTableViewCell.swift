//
//  SettingsTableViewCell.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 12.08.2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
   
    private let rocketSettingsLabel = UILabel(text: "Полная нагрузка")
    
    private let rocketSettingsSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["m", "ft"])
        segmentControl.selectedSegmentTintColor = .white
        segmentControl.selectedSegmentIndex = 0
        segmentControl.tintColor = Resources.Colors.specialBackgroundGray
        segmentControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()
   
    private var horizontalDataLaunchStack = UIStackView()
   
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           setupViews()
           setConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
             print(1)
          break
          case 1:
           print(2)
          break
          default:print("nothing")
          break
       }
    }
   
   private func setupViews() {
       
            backgroundColor = Resources.Colors.specialGray
           selectionStyle = .none
       
       
       
       horizontalDataLaunchStack = UIStackView(arrangedSubviews: [rocketSettingsLabel, rocketSettingsSegmentControl],
                                           axis: .horizontal,
                                           spacing: 10)
       horizontalDataLaunchStack.distribution = .fillProportionally
               addSubview(horizontalDataLaunchStack)
       
   }

   private func setConstraints() {
       
       NSLayoutConstraint.activate([
        horizontalDataLaunchStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
        horizontalDataLaunchStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
        horizontalDataLaunchStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
        horizontalDataLaunchStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
       ])
       
   }

}
