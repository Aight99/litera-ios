//
//  TagCollectionView.swift
//  Litera
//
//  Created by ios_developer on 29.04.2023.
//

import UIKit

class TagCollectionView: UICollectionView {
    
    let tagTitles: [String]
    
    init(tagTitles: [String]) {
        self.tagTitles = tagTitles
        let collectionLayout = LeftAlinedCollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        self.backgroundColor = .clear
        self.isScrollEnabled = false
        self.register(TagViewCell.self, forCellWithReuseIdentifier: TagViewCell.reuseID)
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TagCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGSize = tagTitles[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: TagViewCell.fontSize)])
        let width = size.width + TagViewCell.xPadding * 2
        let height = size.height + TagViewCell.yPadding * 2
        return CGSize(width: width, height: height)
    }
}

extension TagCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TagViewCell.reuseID,
            for: indexPath
        ) as? TagViewCell else {
            fatalError("Cannot dequeue valid cell")
        }
        cell.configure(title: tagTitles[indexPath.row])
        return cell
    }
}

class LeftAlinedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var newAttributesArray = [UICollectionViewLayoutAttributes]()
        let superAttributesArray = super.layoutAttributesForElements(in: rect)!
        for (index, attributes) in superAttributesArray.enumerated() {
            if index == 0 || superAttributesArray[index - 1].frame.origin.y != attributes.frame.origin.y {
                attributes.frame.origin.x = sectionInset.left
            } else {
                let previousAttributes = superAttributesArray[index - 1]
                let previousFrameRight = previousAttributes.frame.origin.x + previousAttributes.frame.width
                attributes.frame.origin.x = previousFrameRight + minimumInteritemSpacing
            }
            newAttributesArray.append(attributes)
        }
        return newAttributesArray
    }
}
