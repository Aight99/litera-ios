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
//        imageView.contentMode = .scaleAspectFill
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
    var activatedColor: UIColor = UIColor(named: ColorName.accent)!
    var text = ""
    
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

    init(normalIcon: UIImage, activatedIcon: UIImage) {
        self.normalIcon = normalIcon
        self.activatedIcon = activatedIcon
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
//        backgroundColor = activatedColor
        addSubview(icon)
        addSubview(label)
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
        ])
    }
}
