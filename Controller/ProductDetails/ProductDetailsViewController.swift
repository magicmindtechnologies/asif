//
//  ProductDetailsViewController.swift
//  RajPalaceCustomer
//
//  Created by Raghav Beriwala on 11/03/21.
//

import UIKit

class ProductDetailsViewController: BaseViewController
{
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTabBar()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductDetailsHeaderCell", bundle: Bundle.main), forCellReuseIdentifier: "ProductDetailsHeaderCell")
        tableView.register(UINib(nibName: "DetailsCell", bundle: Bundle.main), forCellReuseIdentifier: "DetailsCell")
        tableView.register(UINib(nibName: "ReviewsCell", bundle: Bundle.main), forCellReuseIdentifier: "ReviewsCell")
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.black
    }
    override func setupTabBar() {
        super.setupTabBar()
        self.tabController.updateUIForIndex(index: 0)
    }
}
extension ProductDetailsViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsHeaderCell") as? ProductDetailsHeaderCell else { return UITableViewCell()}
            
             return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as? DetailsCell else { return UITableViewCell()}
            
             return cell
        case 2...10:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsCell") as? ReviewsCell
                else { return UITableViewCell() }
             return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row {
        case 0:
            return 230
        case 1:
            return 200
        case 2:
            return 100
        default:
            return 105
        }
    }
    
}
