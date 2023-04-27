//
//  BookCoverView.swift
//  Litera
//
//  Created by ios_developer on 26.04.2023.
//

import UIKit

class BookCoverView: UIView {

    private lazy var coverView: UIImageView = {
        // TODO: Replace image
        let image = UIImage(named: "BookCoverDummy")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        // TODO: Add title, authors and gradient
        return imageView
    }()

    
    override func layoutSubviews() {
        addSubview(coverView)
        coverView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coverView.heightAnchor.constraint(equalTo: heightAnchor),
            coverView.widthAnchor.constraint(equalTo: widthAnchor),
            coverView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverView.topAnchor.constraint(equalTo: topAnchor),
        ])
    }
}
