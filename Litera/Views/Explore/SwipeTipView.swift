//
//  SwipeTipView.swift
//  Litera
//
//  Created by ios_developer on 26.04.2023.
//

import UIKit

class SwipeTipView: UIView {
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView(image: normalIcon)
        imageView.tintColor = normalColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var label: UILabel = {
        let labelView = UILabel()
        labelView.textColor = normalColor
        labelView.font = UIFont.systemFont(ofSize: 12)
        labelView.text = text
        return labelView
    }()
    
    let normalIcon: UIImage
    let activatedIcon: UIImage
    let normalColor: UIColor = UIColor(named: ColorName.tip)!
    let isCompact: Bool
    let text: String
    var activatedColor: UIColor = UIColor(named: ColorName.accent)!
    
    private var isTipActive = false
    var isActive: Bool {
        get {
            return isTipActive
        }
        set {
            if newValue {
                icon.image = activatedIcon
                icon.tintColor = activatedColor
                label.textColor = activatedColor
            } else {
                icon.image = normalIcon
                icon.tintColor = normalColor
                label.textColor = normalColor
            }
            isTipActive = newValue
        }
    }

    init(normalIcon: UIImage, activatedIcon: UIImage, text: String, isCompact: Bool = true) {
        self.normalIcon = normalIcon
        self.activatedIcon = activatedIcon
        self.text = text
        self.isCompact = isCompact
        super.init(frame: .zero)
        addSubview(icon)
        addSubview(label)
        setupConstraints()
        let tapHandler = UITapGestureRecognizer(target: self, action: #selector(activateTip))
        addGestureRecognizer(tapHandler)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let labelPadding: CGFloat = isCompact ? 5 : 10
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            icon.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -labelPadding),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
        ])
    }
    
    @objc private func activateTip() {
        isActive = !isActive
    }
}
