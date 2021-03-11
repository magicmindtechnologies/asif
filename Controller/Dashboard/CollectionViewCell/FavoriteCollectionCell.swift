//
//  FavoriteCollectionCell.swift
//  RajPalaceCustomer
//
//  Created by Raghav Beriwala on 10/03/21.
//

import UIKit

class FavoriteCollectionCell: UICollectionViewCell
{
    static let identifier = "FavoriteCollectionCell"
    static func nib() -> UINib{
        return UINib(nibName: "FavoriteCollectionCell", bundle: nil)
    }
          

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
