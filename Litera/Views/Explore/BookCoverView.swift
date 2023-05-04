//
//  BookCoverView.swift
//  Litera
//
//  Created by ios_developer on 26.04.2023.
//

import UIKit

class BookCoverView: UIView {

    private lazy var imageView: UIImageView = {
        // TODO: Replace image
        let image = UIImage(named: "BookCoverDummy")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topGradientColor, middleGradientColor, bottomGradientColor]
        gradientLayer.locations = [0, 0.83, 1]
        return gradientLayer
    }()
    private lazy var authorsView: UILabel = {
        let label = UILabel()
        label.textColor = authorsColor
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = String.dummyAuthors.joined(separator: ", ")
        return label
    }()
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.textColor = titleColor
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = String.dummyTitle
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 3
        return label
    }()

    private let topGradientColor: CGColor = UIColor.clear.cgColor
    private let middleGradientColor: CGColor = UIColor(red: 0.246, green: 0.241, blue: 0.221, alpha: 1).cgColor
    private let bottomGradientColor: CGColor = UIColor(red: 0.217, green: 0.201, blue: 0.156, alpha: 1).cgColor
    private let authorsColor: UIColor = UIColor(named: ColorName.accent)!
    private let titleColor: UIColor = .white
    
    init() {
        super.init(frame: .zero)
        imageView.layer.addSublayer(gradientLayer)
        addSubview(imageView)
        addSubview(titleView)
        addSubview(authorsView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = imageView.bounds
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        authorsView.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomPadding: CGFloat = 32
        let xPadding: CGFloat = 24
        let authorsToTitlePadding: CGFloat = 4
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
            
            authorsView.bottomAnchor.constraint(equalTo: titleView.topAnchor, constant: -authorsToTitlePadding),
            authorsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
            authorsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
        ])
    }
}

extension String {
    fileprivate static var dummyTitle: String {
        return "Гарри Поттер и узник Азкабана"
    }
    
    fileprivate static var dummyAuthors: [String] {
        return ["Дж. К. Роулинг"]
    }
}
