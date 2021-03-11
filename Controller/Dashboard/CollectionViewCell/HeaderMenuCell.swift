//
//  HeaderMenuCell.swift
//  RajPalaceCustomer
//
//  Created by Raghav Beriwala on 10/03/21.
//

import UIKit

class HeaderMenuCell: UICollectionViewCell
{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    static let identifier = "HeaderMenuCell"
       static func nib() -> UINib{
           return UINib(nibName: "HeaderMenuCell", bundle: nil)
       }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
