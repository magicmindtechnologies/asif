//
//  TabBarViewController.swift
//  LeapingFeet
//
//  Created by Magicmind on 01/07/20.
//  Copyright © 2020 Magicmind. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var viewBackground: UIView!
    let selectedColor = UIColor(hexString: "ff301a")
    let defaultColor = UIColor(hexString: "333333")
    
    @IBOutlet weak var buttonProfile: UIButton!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var buttonCart: UIButton!
    @IBOutlet weak var buttonHome: UIButton!
    
    @IBOutlet weak var labelHome : UILabel!
    @IBOutlet weak var labelCart : UILabel!
    @IBOutlet weak var labelSearch : UILabel!
    @IBOutlet weak var labelProfile : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            
            self.viewBackground.layer.cornerRadius = 25
            
            let path = UIBezierPath(roundedRect: self.viewBackground.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 25, height: 25))
            let shadowLayer = CAShapeLayer()
            shadowLayer.path = path.cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: -5)
            shadowLayer.shadowOpacity = 0.3
            shadowLayer.shadowRadius = 5
            shadowLayer.masksToBounds = false
            self.viewBackground.layer.insertSublayer(shadowLayer, at: 0)
        }
        
    }

    
    func updateUIForIndex(index : Int) {
        switch index {
        case 0:
            self.buttonHome.tintColor = selectedColor
            self.buttonCart.tintColor = defaultColor
            self.buttonSearch.tintColor = defaultColor
            self.buttonProfile.tintColor = defaultColor
            
            self.labelHome.textColor = selectedColor
            self.labelCart.textColor = defaultColor
            self.labelSearch.textColor = defaultColor
            self.labelProfile.textColor = defaultColor
            
        case 1:
            self.buttonHome.tintColor = defaultColor
            self.buttonCart.tintColor = selectedColor
            self.buttonSearch.tintColor = defaultColor
            self.buttonProfile.tintColor = defaultColor
            
            self.labelHome.textColor = defaultColor
            self.labelCart.textColor = selectedColor
            self.labelSearch.textColor = defaultColor
            self.labelProfile.textColor = defaultColor
            
        case 2:
            self.buttonHome.tintColor = defaultColor
            self.buttonCart.tintColor = defaultColor
            self.buttonSearch.tintColor = selectedColor
            self.buttonProfile.tintColor = defaultColor
            
            self.labelHome.textColor = defaultColor
            self.labelCart.textColor = defaultColor
            self.labelSearch.textColor = selectedColor
            self.labelProfile.textColor = defaultColor
            
        case 3:
            self.buttonHome.tintColor = defaultColor
            self.buttonCart.tintColor = defaultColor
            self.buttonSearch.tintColor = defaultColor
            self.buttonProfile.tintColor = selectedColor
            
            self.labelHome.textColor = defaultColor
            self.labelCart.textColor = defaultColor
            self.labelSearch.textColor = defaultColor
            self.labelProfile.textColor = selectedColor
            
        default:
            print("")
        }
    }
    
    
}


