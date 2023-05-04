//
//  BookmarksViewController.swift
//  Litera
//
//  Created by ios_developer on 25.04.2023.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        self.tabBarItem.image = UIImage(named: IconName.bookmark)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
