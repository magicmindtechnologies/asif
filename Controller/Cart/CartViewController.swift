//
//  CartViewController.swift
//  Eria
//
//  Created by Magicmind on 11/02/21.
//

import UIKit

class CartViewController: BaseViewController
{
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AddMoreButtonCell", bundle: Bundle.main), forCellReuseIdentifier: "AddMoreButtonCell")
        tableView.register(UINib(nibName: "ApplyCouponCell", bundle: Bundle.main), forCellReuseIdentifier: "ApplyCouponCell")
        tableView.register(UINib(nibName: "CartPriceDetailsCell", bundle: Bundle.main), forCellReuseIdentifier: "CartPriceDetailsCell")
        tableView.register(UINib(nibName: "DashboardListingCell", bundle: Bundle.main), forCellReuseIdentifier: "DashboardListingCell")
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.black
    }
    override func setupTabBar() {
        super.setupTabBar()
        self.tabController.updateUIForIndex(index: 1)
    }
}
extension CartViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.row {
        case 0...3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardListingCell") as? DashboardListingCell else { return UITableViewCell()}
            cell.addcartView.isHidden = true
            
             return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddMoreButtonCell") as? AddMoreButtonCell else { return UITableViewCell()}
            
             return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ApplyCouponCell") as? ApplyCouponCell
                else { return UITableViewCell() }
             return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartPriceDetailsCell") as? CartPriceDetailsCell
                else { return UITableViewCell() }
             return cell
        case 7:
                
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddMoreButtonCell") as? AddMoreButtonCell else { return UITableViewCell()}
            cell.btnAddMore.setTitle("PROCEED", for: .normal)
                       
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
        case 0...3:
            return 105
        case 4:
            return 60
        case 5:
            return 60
        case 6:
            return 250
        case 7:
            return 60
        default:
            return 105
        }
    }
    
}
