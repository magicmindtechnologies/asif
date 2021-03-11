//
//  SearchViewController.swift
//  Eria
//
//  Created by Magicmind on 11/02/21.
//

import UIKit

class SearchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTabBar()
        
    }
    
    override func setupTabBar() {
        super.setupTabBar()
        self.tabController.updateUIForIndex(index: 2)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
