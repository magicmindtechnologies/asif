//
//  DashboardViewController.swift
//  Eria
//
//  Created by Magicmind on 11/02/21.
//

import UIKit

class DashboardViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupTabBar()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HeaderCell", bundle: Bundle.main), forCellReuseIdentifier: "HeaderCell")
        tableView.register(UINib(nibName: "FavoriteCell", bundle: Bundle.main), forCellReuseIdentifier: "FavoriteCell")
        tableView.register(UINib(nibName: "CategoryCell", bundle: Bundle.main), forCellReuseIdentifier: "CategoryCell")
        tableView.register(UINib(nibName: "DashboardListingCell", bundle: Bundle.main), forCellReuseIdentifier: "DashboardListingCell")
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.black
    }
    
    override func setupTabBar() {
        super.setupTabBar()
        self.tabController.updateUIForIndex(index: 0)
    }
}

extension DashboardViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? HeaderCell else { return UITableViewCell()}
            
             return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell") as? FavoriteCell else { return UITableViewCell()}
            
             return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell
                else { return UITableViewCell() }
             return cell
        case 3...10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardListingCell") as? DashboardListingCell
                else { return UITableViewCell() }
            
            if indexPath.row == 4  || indexPath.row == 6
            {
                cell.addcartView.isHidden = true
            }
            else{
                cell.addcartView.isHidden = false
            }
             return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row {
        case 0:
            return 225
        case 1:
            return 280
        case 2:
            return 60
        default:
            return 105
        }
    }
    
}

