//
//  DataTableViewCell.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 30.08.2022.
//

import UIKit

class DataTableViewCell: UITableViewCell {
   
    private let leftLabel = UILabel(text: "Первый запуск")
    private let rightLabel = UILabel(text: "7 февраля, 2018")
   
    private var horizontalDataLaunchStack = UIStackView()
   
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           setupViews()
           setConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
   
   private func setupViews() {
       
       rightLabel.textAlignment = .right
       leftLabel.textAlignment = .left
       
        backgroundColor = .black
       selectionStyle = .none
       
       horizontalDataLaunchStack = UIStackView(arrangedSubviews: [leftLabel, rightLabel],
                                           axis: .horizontal,
                                           spacing: 10)
//       horizontalDataLaunchStack.distribution = .fillEqually
       contentView.addSubview(horizontalDataLaunchStack)
       
   }

   private func setConstraints() {
       
       NSLayoutConstraint.activate([
        horizontalDataLaunchStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        horizontalDataLaunchStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        horizontalDataLaunchStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        horizontalDataLaunchStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
       ])
       
   }

}
