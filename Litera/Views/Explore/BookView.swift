//
//  BookView.swift
//  Litera
//
//  Created by ios_developer on 02.05.2023.
//

import UIKit

import UIKit

class BookView: UIView {

    private lazy var coverView = {
        let coverView = BookCoverView()
        let tapHandler = UITapGestureRecognizer(target: self, action: #selector(turnOverBook))
        coverView.addGestureRecognizer(tapHandler)
        return coverView
    }()
    private lazy var backView = {
        let backView = BookDescriptionView()
        let tapHandler = UITapGestureRecognizer(target: self, action: #selector(turnOverBook))
        backView.addGestureRecognizer(tapHandler)
        backView.isActive = false
        return backView
    }()
    
    init() {
        super.init(frame: .zero)
        layer.shadowColor = UIColor(red: 0.608, green: 0.595, blue: 0.545, alpha: 1).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 12
        addSubview(backView)
        addSubview(coverView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        coverView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            coverView.topAnchor.constraint(equalTo: topAnchor),
            coverView.bottomAnchor.constraint(equalTo: bottomAnchor),
            coverView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc private func turnOverBook() {
        coverView.isHidden = !coverView.isHidden
        backView.isActive = !backView.isActive
    }
}

