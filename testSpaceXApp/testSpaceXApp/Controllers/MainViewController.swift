//
//  TestViewController.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 18.08.2022.
//

import UIKit

struct RocketData {
    
    let nameLabel: String
    let image: UIImage
}

class MainViewController: UIViewController {

    private lazy var pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.numberOfPages = onboardingArray.count
        pageControl.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        pageControl.backgroundColor = Resources.Colors.specialBackgroundGray
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender: )), for: .touchUpInside)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let idOnboardingCell = "idOnboardingCell"
    
    private var onboardingArray = [RocketData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    @objc private func pageControlTapHandler(sender: UIPageControl) {
        
        collectionView.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    private func setupViews() {
        view.backgroundColor = .green

        view.addSubview(collectionView)
        
        
        guard let imageFirst = UIImage(named: "falcon1"),
        let imageSecond = UIImage(named: "falcon9"),
        let imageThird = UIImage(named: "falconheavy"),
        let imageFour = UIImage(named: "starship")                                                        else {
            return
        }
        
        let firstScreen = RocketData(nameLabel: "Falcon 1",
                                          image: imageFirst)
        let secondScreen = RocketData(nameLabel: "Falcon 9",
                                            image: imageSecond)
        let thirdScreen = RocketData(nameLabel: "Falcon Heavy",
                                           image: imageThird)
        let fourScreen = RocketData(nameLabel: "Starship",
                                           image: imageFour)
        
        onboardingArray = [firstScreen, secondScreen, thirdScreen, fourScreen]
        
        view.addSubview(pageControl)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: idOnboardingCell)
    }
    
    private func setDelegates() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idOnboardingCell, for: indexPath) as! MainCollectionViewCell
        let model = onboardingArray[indexPath.row]
        cell.cellConfigure(model: model)
        
        cell.dataView.showLaunchVCDelegate = self
        cell.dataView.showSettingsVCDelgate = self
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
}
//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
    }
    
}

extension MainViewController: ShowLaunchVCProtocol {
    
    func buttonTapped() {
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        
        let launchVC = LaunchViewController()
        navigationController?.pushViewController(launchVC, animated: true)
    }
}

extension MainViewController: ShowSettingsVCProtocol {
    
    func settingsButtonTapped() {
        
        let setVC = SettingsViewController()
        present(setVC, animated: true)
    }
}

extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            pageControl.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
