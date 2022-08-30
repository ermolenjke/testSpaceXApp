//
//  DataView.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 10.08.2022.
//

import UIKit

protocol ShowLaunchVCProtocol: AnyObject {
    
    func buttonTapped()
}

protocol ShowSettingsVCProtocol: AnyObject {
    
    func settingsButtonTapped()
}

class DataView: UIView {
    
    
    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        button.showsTouchWhenHighlighted = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let rocketNameLabel: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Resources.Colors.specialGray
        button.layer.cornerRadius = 10
        button.setTitle("Посмотреть запуски", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(showLaunchesButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dataCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let dataTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
//        tableView.isPagingEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var topStackView = UIStackView()
    private let withReuseIdentifier = "withReuseIdentifier"
    private let withIdentifier = "withIdentifier"
    
    weak var showLaunchVCDelegate: ShowLaunchVCProtocol?
    weak var showSettingsVCDelgate: ShowSettingsVCProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 30
        backgroundColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        
        setDelagate()
        setupViews()
        setConstraints()
        dataCollectionView.register(DataCollectionViewCell.self, forCellWithReuseIdentifier: withReuseIdentifier)
        dataTableView.register(DataTableViewCell.self, forCellReuseIdentifier: withIdentifier)
    }
    
    private func setDelagate() {
        
        dataCollectionView.delegate = self
        dataCollectionView.dataSource = self
        
        dataTableView.delegate = self
        dataTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func settingsButtonTapped() {
        
        showSettingsVCDelgate?.settingsButtonTapped()
    }
    
    @objc private func showLaunchesButtonTapped() {
        
        showLaunchVCDelegate?.buttonTapped()
    }
    
    private func setupViews() {
        
        topStackView = UIStackView(arrangedSubviews: [rocketNameLabel, settingsButton],
                                   axis: .horizontal,
                                   spacing: 10)
        topStackView.distribution = .equalSpacing
        addSubview(topStackView)
        addSubview(showLaunchesButton)
        addSubview(dataCollectionView)
        addSubview(dataTableView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            topStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            dataCollectionView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20),
            dataCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dataCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dataCollectionView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            dataTableView.topAnchor.constraint(equalTo: dataCollectionView.bottomAnchor, constant: 30),
            dataTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dataTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dataTableView.bottomAnchor.constraint(equalTo: showLaunchesButton.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
//            showLaunchesButton.topAnchor.constraint(equalTo: dataTableView.bottomAnchor, constant: 30),
            showLaunchesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            showLaunchesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            showLaunchesButton.heightAnchor.constraint(equalToConstant: 60),
            showLaunchesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
        
        
    }
}

extension DataView: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: withReuseIdentifier, for: indexPath)
        return cell
    }
}

extension DataView: UICollectionViewDelegate {
    
}

extension DataView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 125, height: dataCollectionView.frame.height)
    }
}

extension DataView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier: withIdentifier, for: indexPath) as! DataTableViewCell
        return cell
    }
}

extension DataView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    let sections = Bundle.main.decode([MSection].self, from: "model.json")
//    var collectionView: UICollectionView!
//
//    var dataSource: UICollectionViewDiffableDataSource<MSection, MChat>?
//
//
//    func setupCollectionView() {
//        collectionView = UICollectionView(frame: bounds, collectionViewLayout: createCompositionalLayout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
//        addSubview(collectionView)
//
////        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseId)
////        collectionView.register(WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuseId)
//
//    }
//
//    // MARK: - Manage the data in UICV
//
////    func createDataSource() {
////        dataSource = UICollectionViewDiffableDataSource<MSection, MChat>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
////            switch self.sections[indexPath.section].type {
////            case "activeChats":
////                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActiveChatCell.reuseId, for: indexPath) as? ActiveChatCell
////                cell?.configure(with: chat)
////                return cell
////            default:
////                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WaitingChatCell.reuseId, for: indexPath) as? WaitingChatCell
////                cell?.configure(with: chat)
////                return cell
////            }
////        })
////    }
//
//    func reloadData() {
//        var snapshot = NSDiffableDataSourceSnapshot<MSection, MChat>()
//        snapshot.appendSections(sections)
//
//        for section in sections {
//            snapshot.appendItems(section.items, toSection: section)
//        }
//
//        dataSource?.apply(snapshot)
//    }
//
//    // MARK: - Setup Layout
//
//    func createCompositionalLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
//            let section = self.sections[sectionIndex]
//
//            switch section.type {
//            case "activeChats":
//                return self.createActiveChatSection()
//            default:
//                return self.createWaitingChatSection()
//            }
//        }
//
//        return layout
//    }
//
//    func createWaitingChatSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                              heightDimension: .fractionalHeight(1))
//        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
//
//
//        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(104),
//                                                     heightDimension: .estimated(88))
//        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
//
//        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//        layoutSection.orthogonalScrollingBehavior = .continuous
//        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 66, leading: 12, bottom: 0, trailing: 12)
//
//        return layoutSection
//    }
//
//    func createActiveChatSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(86))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                               heightDimension: .estimated(1))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = NSDirectionalEdgeInsets.init(top: 66, leading: 20, bottom: 0, trailing: 20)
//        return section
//    }
//
//    // section -> groups -> items -> size
//}

