//
//  BaseViewController.swift
//  Eria
//
//  Created by Magicmind on 19/01/21.
//

import UIKit
import PureLayout

class BaseViewController: UIViewController {
    
    let navController = NavBarViewController.instantiate(fromAppStoryboard: .Main)
    let tabController = TabBarViewController.instantiate(fromAppStoryboard: .Main)
    
    //Initial TabBar height
    var tabBarHeight: CGFloat = 64.0
    
    //Initial Navbar height
    var navBarHeight: CGFloat = 44.0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    
    // MARK:- Utility Functions
    
    func showComingSoon() {
        Common.showAlert(title: DefaultMessages.comingSoon, message: "")
    }
    
    
    
    // MARK:- ------ NAVIGATION BAR ------ -
    
    // MARK:- Add Navigation Bar
    private func addNavigationBar() {
        self.view.addSubview((navController.view)!)
        
        DispatchQueue.main.async {
            
            self.navController.view.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
            self.navController.view.autoPinEdge(toSuperviewEdge: .top, withInset: 0.0)
            self.navController.view.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0.0)
            self.navController.view.autoSetDimension(.height, toSize: self.navBarHeight + self.safeAreaTopInsect)
        }
        
        navController.buttonLeft.addAction(for: .touchUpInside) { (button) in
            self.actionButtonLeft()
        }
        
        navController.buttonRight.addAction(for: .touchUpInside) { (button) in
            self.actionButtonRight()
        }
        
        self.hideButtonLeft()
        self.hideButtonRight()
    }
    
    
    
    open func setupNavigationBar() {
        //inherite in child
        self.addNavigationBar()
        
    }
    
    open func showNavigationBar() {
        self.navController.view.isHidden = false
    }
    
    open func hideNavigationBar() {
        self.navController.view.isHidden = true
    }
    
    // MARK:- Nav Bar Button Actions
    func actionButtonLeft() {
        
    }
    
    
    func actionButtonRight() {
        
    }
    
    
    // MARK:- Show / Hide Nav Bar Buttons
    func hideButtonLeft() {
        navController.buttonLeft.isHidden = true
    }
    func showButtonLeft() {
        navController.buttonLeft.isHidden = false
    }
    
    func hideButtonRight() {
        navController.viewButtonRightBg.isHidden = true
    }
    func showButtonRight() {
        navController.viewButtonRightBg.isHidden = false
    }
    
    
    // MARK:- Set Nav Bar title text
    func setTitleLabelText(text:String) {
        navController.titleLabel.text = text
    }
    
    func setTitleLabelColor(color : UIColor) {
        navController.titleLabel.textColor = color
    }
    
    func setBackgroundColor(color : UIColor) {
        navController.view.backgroundColor = color
    }
    
    
    func adjustFontSize() {
        navController.titleLabel.adjustsFontSizeToFitWidth = true
        navController.titleLabel.minimumScaleFactor = 0.2
    }
    
    // MARK:- Set Nav Bar Buttons Image
    func setButtonLeftImage(image:UIImage) {
        navController.buttonLeft.setImage(image, for: .normal)
    }
    func setButtonRightImage(image:UIImage) {
        navController.imageViewButtonRight.image = image
    }
    
    func setButtonLeftTitle(text:String) {
        navController.buttonLeft.setTitle(text, for: .normal)
    }
    
    func setButtonLeftTitleColor(color : UIColor) {
        navController.buttonLeft.setTitleColor(color, for: .normal)
    }
    
    func setButtonRightTitle(text:String) {
        navController.labelCartCount.text = text
    }
    
    func configureRightButtonForCart() {
        navController.imageViewButtonRight.image = UIImage(named: "cartIconBlack")
        navController.imageViewButtonRight.backgroundColor = .clear
        navController.imageViewButtonRight.contentMode = .scaleAspectFit
        navController.labelCartCount.isHidden = false
    }
    
    func configureRightButtonForFavourite() {
        navController.imageViewButtonRight.image = UIImage(named: "favourite")
        navController.imageViewButtonRight.backgroundColor = .white
        
        let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        let cornerRadius = navController.imageViewButtonRight.bounds.height / 2
        navController.imageViewButtonRight.addShadowAndCornerRadious(cornerRadius: cornerRadius, shadowColor: shadowColor)
        navController.imageViewButtonRight.contentMode = .center
        navController.labelCartCount.isHidden = true
    }
    
    func configureRightButtonForUnfavourite() {
        navController.imageViewButtonRight.image = UIImage(named: "cartIconBlack")
        navController.imageViewButtonRight.backgroundColor = .white
        
        let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        let cornerRadius = navController.imageViewButtonRight.bounds.height / 2
        navController.imageViewButtonRight.addShadowAndCornerRadious(cornerRadius: cornerRadius, shadowColor: shadowColor)
        navController.imageViewButtonRight.contentMode = .center
        navController.labelCartCount.isHidden = true
    }
    
    // MARK:- ------ TAB BAR ------ -
    
    private func addTabBar() {
        self.view.addSubview((tabController.view)!)
        
        DispatchQueue.main.async {
            
            // Add Autolayout Constraints
            self.tabController.view.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
            self.tabController.view.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0.0)
            self.tabController.view.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0.0)
            self.tabController.view.autoSetDimension(.height, toSize: self.tabBarHeight + self.safeAreaBottomInsect)
            
            
            self.tabController.buttonHome.addAction(for: .touchUpInside) { (button) in
                Common.sharedInstance.commonTabBarController.selectedIndex = 0
            }
            
            self.tabController.buttonCart.addAction(for: .touchUpInside) { (button) in
                Common.sharedInstance.commonTabBarController.selectedIndex = 1
            }
            
            self.tabController.buttonSearch.addAction(for: .touchUpInside) { (button) in
                Common.sharedInstance.commonTabBarController.selectedIndex = 2
            }
            
            self.tabController.buttonProfile.addAction(for: .touchUpInside) { (button) in
                Common.sharedInstance.commonTabBarController.selectedIndex = 3
            }
            
        }
    }
    
    
    
    open func setupTabBar() {
        //inherite in child
        self.addTabBar()
        
    }
}
