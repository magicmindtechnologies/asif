//
//  HeaderCell.swift
//  RajPalaceCustomer
//
//  Created by Raghav Beriwala on 10/03/21.
//

import UIKit

class HeaderCell: UITableViewCell
{
    @IBOutlet weak var colectionView: UICollectionView!
       
       var imgArr = ["paratha","Dosa","Sandwich","Idli"]
       var lblarr = ["Paratha","Dosa","Sandwich","Idli"]

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.colectionView.delegate = self
        self.colectionView.dataSource = self
        self.colectionView.register(HeaderMenuCell.nib(), forCellWithReuseIdentifier: HeaderMenuCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
extension HeaderCell : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderMenuCell.identifier, for: indexPath) as? HeaderMenuCell else {return UICollectionViewCell()}
        cell.imgView.image = UIImage(named: imgArr[indexPath.row])
        cell.lblName.text = lblarr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = (collectionView.frame.width)/4
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
