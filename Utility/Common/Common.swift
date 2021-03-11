//
//  Common.swift
//  Eria
//
//  Created by Magicmind on 19/01/21.
//

import UIKit

class Common: NSObject {
    
    static let sharedInstance   = Common()
    var commonTabBarController = UITabBarController()
    enum RootControllerType {
        case login
        case location
        case home
    }
    
    
    
    
    // MARK: - Class Methods
    /* Convert string from any value */
    class func getStringValueFromAPIValue(apiValue: Any?, defaultValue: String,shoudCheckEmptyValue: Bool = false) -> String {
        
        var valueString = String(describing: apiValue ?? defaultValue)
        
        if ((valueString == "(NULL)") || (valueString == "<NULL>") || (valueString == "<null>") || (valueString == "(null)")) {
            valueString = defaultValue
        }
        //For Double or integer value return default value as 0 or 0.0 if empty string found
        if shoudCheckEmptyValue {
            if valueString == "" || valueString == " " {
                valueString = defaultValue
            }
        }
        return valueString
    }
    
    
    /* Change root viewcontroller */
    class func changeRootController(rootControllerType: RootControllerType) -> Void {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = nil
        switch rootControllerType {
        case .login:
            let controller = LoginViewController.instantiate(fromAppStoryboard: .Login)
            let navController = UINavigationController(rootViewController: controller)
            navController.isNavigationBarHidden = true
            appDelegate.window?.rootViewController = navController
        case .location:
            let controller = LocationViewController.instantiate(fromAppStoryboard: .Main)
            let navController = UINavigationController(rootViewController: controller)
            navController.isNavigationBarHidden = true
            appDelegate.window?.rootViewController = navController
        case .home:
            
            let tabBarController = UITabBarController()
            tabBarController.tabBar.isHidden = true
            
            let homeController = DashboardViewController.instantiate(fromAppStoryboard: .Home)
            let homeNavController = UINavigationController(rootViewController: homeController)
            homeNavController.isNavigationBarHidden = true
            
            let cartController = CartViewController.instantiate(fromAppStoryboard: .Home)
            let cartNavBarController = UINavigationController(rootViewController: cartController)
            cartNavBarController.isNavigationBarHidden = true
            
            let searchViewController = SearchViewController.instantiate(fromAppStoryboard: .Home)
            let searchNavBarController = UINavigationController(rootViewController: searchViewController)
            searchNavBarController.isNavigationBarHidden = true
            
            let profileViewController = ProfileViewController.instantiate(fromAppStoryboard: .Home)
            let profileNavBarController = UINavigationController(rootViewController: profileViewController)
            profileNavBarController.isNavigationBarHidden = true
            
            tabBarController.viewControllers = [homeNavController, cartNavBarController,searchNavBarController,profileNavBarController]
            
            self.sharedInstance.commonTabBarController = tabBarController
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = tabBarController
 
        }
    }
    
    // MARK: - Show Alert & Toast
    
    
    class func showAlert(title:String?, message:String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: DefaultMessages.ok, style: UIAlertAction.Style.default, handler: nil))
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController?.present(alert, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    class func showAlertWithAction(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController?.present(alertController, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }

    
}



