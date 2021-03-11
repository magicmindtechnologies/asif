//
//  LocationManager.swift
//  Eria
//
//  Created by Magicmind on 19/01/21.
//

import Foundation
import CoreLocation
import UIKit

class LocationManager: NSObject {
    
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    
    //Temporarily store current location
    private var userLocation: CLLocation?
    var usersLocation: (CLLocation?) -> Void = {_ in}
    
    public func requestUserLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    ///Fetched User's location
    public func getUserLocation() -> CLLocation? {
        return userLocation
    }
    
    public func requestEnableUserLocation() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus(){
            case .denied:
                self.showAlertForLocationAuthorization()
            case .notDetermined:
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            case .restricted:
                self.showAlertForLocationAuthorization()
            default:
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            }
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func showAlertForLocationAuthorization() {
        
        let alertController = UIAlertController(title: DefaultMessages.unableToAccessLocation, message: DefaultMessages.enableFromSettings, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: DefaultMessages.settings, style: .default) { (alertAction) in
            if let bundleId = Bundle.main.bundleIdentifier,
                let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")
            {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(settingsAction)
        
        let cancelAction = UIAlertAction(title: DefaultMessages.cancel, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController?.present(alertController, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}


extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
        
        /* you can use these values*/
        //GlobalConstants.curLatitude = "\(location.coordinate.latitude)"
        //GlobalConstants.curLongitude = "\(location.coordinate.longitude)"
        
        self.userLocation = location
        self.usersLocation(location)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("FAILED :",error.localizedDescription)
        self.usersLocation(nil)
        self.locationManager.stopUpdatingLocation()
    }
}
