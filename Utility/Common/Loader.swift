//
//  Loader.swift
//  Eria
//
//  Created by Magicmind on 19/01/21.
//

import UIKit
import NVActivityIndicatorView

class Loader: UIViewController,NVActivityIndicatorViewable {

    static let  sharedManager = Loader()
    var  activityIndicator = NVActivityIndicatorView.init(frame: CGRect.zero)
    
    //14,29,31,23,30
    func startAnimatingLoader(){
        self.startAnimating(CGSize(width: 50, height: 50), message: "", type: .ballClipRotateMultiple ,color: .white, backgroundColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7))
    }
    
    func startAnimatingLoaderForSongs(){
        self.startAnimating(CGSize(width: 50, height: 50), message: "", type: .lineScalePulseOut ,color: .white, backgroundColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7))
    }
    
    func stopAnimatingLoader() {
        self.stopAnimating()
    }
    
    //MARK:- Show loader on particular View -
    
    func showLoaderOnParticularView(view: UIView) {
        let frame = CGRect(x: 0, y: view.frame.origin.y, width: view.frame.width, height: view.frame.height)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = .circleStrokeSpin // add your type
        activityIndicator.color = UIColor.white // add your color
        
        view.addSubview(activityIndicator) // or use  webView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func showLoaderOnLoadMore(view: UIView,height: CGFloat = 50.0, haveTabbar: Bool = false) {
        if activityIndicator.frame == CGRect.zero {
            var frame: CGRect = CGRect.zero
            if haveTabbar {
                frame = CGRect(x: (view.frame.width / 2) - 15, y: view.frame.height - 105, width: height, height: height)
            }else{
               frame = CGRect(x: (view.frame.width / 2) - 15, y: view.frame.height - height, width: height, height: height)
            }
            activityIndicator = NVActivityIndicatorView(frame: frame)
            activityIndicator.type = .ballClipRotateMultiple // add your type
            activityIndicator.color = UIColor.darkGray
            activityIndicator.removeFromSuperview()
            view.insertSubview(activityIndicator, at: view.subviews.count)
            activityIndicator.startAnimating()
        }
    }
    func hideLoaderOnParticularView() {
        if activityIndicator.frame != CGRect.zero {
            activityIndicator.frame = CGRect.zero
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
