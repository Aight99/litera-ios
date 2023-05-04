//
//  TagViewCell.swift
//  Litera
//
//  Created by ios_developer on 29.04.2023.
//

import UIKit

class TagViewCell: UICollectionViewCell {
    
    static let reuseID = "TagViewCell"
    static let fontSize: CGFloat = 15
    static let xPadding: CGFloat = 10
    static let yPadding: CGFloat = 5

    private lazy var tagView: UILabel = {
        let label = UILabel()
        label.text = title
        label.textColor = .black
        label.font = .systemFont(ofSize: TagViewCell.fontSize)
        return label
    }()
    
    private(set) var title = " "
    
    public func configure(title: String) {
        self.title = title
        contentView.addSubview(tagView)
        backgroundColor = .white
        layer.cornerRadius = frame.height / 2.2
        setupConstraints()
    }
    
    private func setupConstraints() {
        tagView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: topAnchor),
            tagView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: TagViewCell.xPadding),
            tagView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
