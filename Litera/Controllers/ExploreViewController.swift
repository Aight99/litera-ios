//
//  ViewController.swift
//  Litera
//
//  Created by ios_developer on 24.04.2023.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private lazy var bookCoverView = {
        let coverView = BookCoverView(frame: .zero)
        return coverView
    }()
    private lazy var yesTipView = {
        let yesImage = UIImage(systemName: "checkmark")!
        let rightImage = UIImage(named: IconName.arrowRight)!
        let tipView = SwipeTipView(
            normalIcon: rightImage,
            activatedIcon: yesImage
        )
        tipView.activatedColor = .systemGreen
        tipView.text = "Люблю такое"
        return tipView
    }()
    private lazy var noTipView = {
        let noImage = UIImage(systemName: "xmark")!
        let leftImage = UIImage(named: IconName.arrowLeft)!
        let tipView = SwipeTipView(
            normalIcon: leftImage,
            activatedIcon: noImage
        )
        tipView.activatedColor = .systemRed
        tipView.text = "Не предлагать"
        return tipView
    }()
    private lazy var skipTipView = {
        let skipImage = UIImage(systemName: "chevron.up")!
        let upImage = UIImage(systemName: "chevron.up")!
        let tipView = SwipeTipView(
            normalIcon: upImage,
            activatedIcon: skipImage
        )
        tipView.text = "Пропустить"
        return tipView
    }()
    private lazy var saveTipView = {
        let saveImage = UIImage(named: IconName.bookmark)!
        let downImage = UIImage(systemName: "chevron.down")!
        let tipView = SwipeTipView(
            normalIcon: downImage,
            activatedIcon: saveImage
        )
        tipView.text = "Сохранить"
        return tipView
    }()
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
//        self.title = "Books"
        self.tabBarItem.image = UIImage(named: IconName.explore)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: ColorName.background)
        setupUI()
        setupTips()
    }
    
    private func setupUI() {
        view.addSubview(bookCoverView)
        bookCoverView.translatesAutoresizingMaskIntoConstraints = false
        
        // TODO: Fix this, tipWidth + 10
        let topPadding: CGFloat = 55
        
        // С тестовой обложкой работает хорошо и без него, но мне кажется, что такое ограничение нужно,
        // чтобы соблюдать равенство размеров карточек
//        let heightConstraint = bookCoverView.heightAnchor.constraint(equalTo: bookCoverView.widthAnchor, multiplier: 1.5)
//        heightConstraint.priority = .
        let maxHeightConstraint = bookCoverView.heightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.75)
        maxHeightConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            bookCoverView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookCoverView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topPadding),
            bookCoverView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            maxHeightConstraint,
        ])
        
    }
    
    private func setupTips() {
        view.addSubview(yesTipView)
        view.addSubview(noTipView)
        view.addSubview(saveTipView)
        view.addSubview(skipTipView)
        
        yesTipView.translatesAutoresizingMaskIntoConstraints = false
        noTipView.translatesAutoresizingMaskIntoConstraints = false
        saveTipView.translatesAutoresizingMaskIntoConstraints = false
        skipTipView.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomPadding: CGFloat = 30
        let tipWidth: CGFloat = 80
        let tipHeight: CGFloat = 45
        
        let rightSpace = UILayoutGuide()
        let leftSpace = UILayoutGuide()
        view.addLayoutGuide(rightSpace)
        view.addLayoutGuide(leftSpace)
        
        NSLayoutConstraint.activate([
            saveTipView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            saveTipView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bottomPadding),
            saveTipView.widthAnchor.constraint(equalToConstant: tipWidth),
            saveTipView.heightAnchor.constraint(equalToConstant: tipHeight),
            
            skipTipView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            skipTipView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            skipTipView.widthAnchor.constraint(equalToConstant: tipWidth),
            skipTipView.heightAnchor.constraint(equalToConstant: tipHeight),
            
            rightSpace.leftAnchor.constraint(equalTo: saveTipView.rightAnchor),
            rightSpace.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            yesTipView.centerXAnchor.constraint(equalTo: rightSpace.centerXAnchor),
            yesTipView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bottomPadding),
            yesTipView.widthAnchor.constraint(equalToConstant: tipWidth),
            yesTipView.heightAnchor.constraint(equalToConstant: tipHeight),
            
            leftSpace.rightAnchor.constraint(equalTo: saveTipView.leftAnchor),
            leftSpace.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            noTipView.centerXAnchor.constraint(equalTo: leftSpace.centerXAnchor),
            noTipView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bottomPadding),
            noTipView.widthAnchor.constraint(equalToConstant: tipWidth),
            noTipView.heightAnchor.constraint(equalToConstant: tipHeight),
        ])
    }


}

