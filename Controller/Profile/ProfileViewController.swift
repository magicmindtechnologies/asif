//
//  ProfileViewController.swift
//  RajPalaceCustomer
//
//  Created by Raghav Beriwala on 09/03/21.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    override func setupTabBar() {
        super.setupTabBar()
        self.tabController.updateUIForIndex(index: 1)
    }
}
