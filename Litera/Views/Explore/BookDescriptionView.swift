//
//  BookDescriptionView.swift
//  Litera
//
//  Created by ios_developer on 27.04.2023.
//

import UIKit

class BookDescriptionView: UIView {

    private lazy var descriptionText: UILabel = {
        let labelView = UILabel()
        labelView.textColor = descriptionColor
        labelView.font = UIFont.systemFont(ofSize: 16)
        labelView.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07
        paragraphStyle.paragraphSpacing = 4
        paragraphStyle.lineBreakMode = .byTruncatingTail
        let text = String.dummyDescription
        let attributedText = NSAttributedString(string: text, attributes: [.paragraphStyle: paragraphStyle])
        labelView.attributedText = attributedText
        return labelView
    }()
    private lazy var tagCollection: TagCollectionView = {
        // TODO: Real dataSource
        let tags = String.dummyTags
        let tagCollection = TagCollectionView(tagTitles: tags)
        return tagCollection
    }()
    private lazy var openBookButton: UIButton = {
        let buttonView = UIButton()
        let color = UIColor(named: ColorName.accent)
        buttonView.setTitleColor(color, for: .normal)
        buttonView.setTitleColor(.systemGray, for: .highlighted)
        let image = UIImage(named: IconName.bookStore)
        buttonView.setImage(image, for: .normal)
        buttonView.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        buttonView.setTitle("Открыть в LiveLib", for: .normal)
        buttonView.imageEdgeInsets.left = -12
        return buttonView
    }()
    
    var isActive: Bool {
        get {
            openBookButton.isUserInteractionEnabled
        }
        set {
            openBookButton.isUserInteractionEnabled = newValue
        }
    }

    private var tagCollectionHeightConstraint: NSLayoutConstraint?
    let cardBackColor = UIColor(named: ColorName.cardBack)
    let descriptionColor = UIColor.white
    
    init() {
        super.init(frame: .zero)
        backgroundColor = cardBackColor
        layer.cornerRadius = 12
        layer.masksToBounds = true
        addSubview(descriptionText)
        addSubview(tagCollection)
        addSubview(openBookButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        tagCollection.translatesAutoresizingMaskIntoConstraints = false
        openBookButton.translatesAutoresizingMaskIntoConstraints = false
        
        let blockPadding: CGFloat = 20
        let buttonPadding: CGFloat = 40
        tagCollectionHeightConstraint = tagCollection.heightAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            openBookButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            openBookButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -buttonPadding),
            openBookButton.heightAnchor.constraint(equalToConstant: openBookButton.frame.height + buttonPadding),

            descriptionText.topAnchor.constraint(equalTo: topAnchor, constant: blockPadding),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: blockPadding),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -blockPadding),

            tagCollection.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: blockPadding),
            tagCollection.bottomAnchor.constraint(equalTo: openBookButton.topAnchor, constant: -blockPadding),
            tagCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: blockPadding),
            tagCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -blockPadding),
            tagCollectionHeightConstraint!,
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let gap: CGFloat = 2
        tagCollectionHeightConstraint?.constant = tagCollection.collectionViewLayout.collectionViewContentSize.height + gap
    }
}

extension String {
    fileprivate static var dummyDescription: String {
        return """
        Гарри взрослеет, и вместе с тем жить в Хогвартсе всё страшнее. Из тюрьмы для волшебников Азкабан сбежал опасный преступник - Сириус Блэк. Мир наполнился слухами, что он ищет и хочет убить одного тринадцатилетнего парня, совсем обычного на первый взгляд. Его имя — Гарри Поттер.
        Специальное издание для учеников и выпускников «Гриффиндора» к 20-летию первой публикации книги «Гарри Поттер и узник Азкабана».
        """
    }
    
    fileprivate static var dummyTags: [String] {
        return ["Для подростков", "Про волшебников", "Зарубежное фэнтези", "Экранизация", "Гарри", "Поттер"]
    }
}
