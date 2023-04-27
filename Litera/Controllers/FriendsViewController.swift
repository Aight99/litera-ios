//
//  FriendsViewController.swift
//  Litera
//
//  Created by ios_developer on 25.04.2023.
//

import UIKit

class FriendsViewController: UIViewController {
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
//        self.title = "Friends"
        self.tabBarItem.image = UIImage(named: IconName.friends)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
