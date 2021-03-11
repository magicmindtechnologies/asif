//
//  Constants.swift
//  Eria
//
//  Created by Magicmind on 19/01/21.
//

import UIKit




struct AppConstants {
    static let GMSPlacesClientApiKey  : String = ""
}

struct UserDefaultsKey {
    static let FCMToken  : String = "FCMToken"
    static let launchedBefore  : String = "launchedBefore"
}

struct DefaultMessages {
    
    
    static let takePhoto                        : String = "Take Photo";
    static let choosePhoto                      : String = "Choose Photo";
    static let takeVideo                        : String = "Take Video";
    static let chooseVideo                      : String = "Choose Video";
    static let removePhoto                      : String = "Remove Photo";
    static let removeVideo                      : String = "Remove Video";
    static let unableToAccessCamera              : String = "Unable to access camera";
    static let unableToAccessPhoto               : String = "Unable to access photo library ";
    static let unableToAccessLocation             : String = "Unable to access location";
    static let ok                              : String = "Ok";
    static let enableFromSettings               : String = "Please enable from settings";
    
    static let yes                              : String = "Yes";
    static let no                               : String = "No";
    static let settings                         : String = "Settings";
    static let cancel                           : String = "Cancel";
    static let location                         : String = "Location";
    static let warning                          : String = "Warning";
    static let error                            : String = "Error";
    static let success                          : String = "Success";
    static let comingSoon                       : String = "Coming Soon!";
    static let noData                           : String = "No data available";
    static let noInternetFound                  : String = "The Internet connection appears to be offline.";
    static let somethingWrong                   : String = "Something went wrong. Please try again later.";
    static let pleaseTryAgain                   : String = "Please try again";
    static let pleaseWait                       : String = "Please wait";
    static let timeOut                          : String = "Time out";
    
    static let logoutMessage                    : String = "Are you sure you want to logout?"
    static let logout                           : String = "Logout"
    
    
    static let signIn                           : String = "Sign in"
    static let signUp                           : String = "Sign up"
    static let forgotPassword                   : String = "Forgot Password"
    static let enterCode                         : String = "Enter code"
    static let enterName                         : String = "Enter your name"
    static let emptyName                        : String = "Please enter name."
    static let emptyEmailAddress                : String = "Please enter email address."
    static let validEmail                       : String = "Please enter a valid email address."
    static let emptyPassord                     : String = "Please enter password."
    static let validPassword                    : String = "Password must be minimum 6 characters"
    static let checkLocation                    : String = "Please agree to allow your location while using the app";
    static let emptyZip                        : String = "Please enter zip code."
    static let emptyCountry                    : String = "Please choose country."
    static let emptyMobile                      : String = "Please enter mobile number."
    static let emptyGender                      : String = "Please enter mobile gender."
    static let emptyDOB                         : String = "Please enter date of birth."
    static let emptyDanceStyle                  : String = "Please enter dance style."
    static let emptyCourse                      : String = "Please enter course."
    static let emptyClassOption                 : String = "Please enter class option."
    static let emptyImage                       : String = "Please upload a picture."
    static let emptyVideo                       : String = "Please upload a video."
    static let emptyDescription                 : String = "Please enter brief description of your interest in joining."
    static let emptyOldPassword                 : String = "Please enter old password."
    static let validOldPassword                  : String = "Please enter a valid old password."
    static let emptyNewPassword                 : String = "Please enter new password."
    static let validNewPassword                  : String = "Please enter a valid new password."
    static let emptyRePassword                    : String = "Please enter confirm password."
    static let validRePassword                    : String = "Please enter a valid confirm password."
    static let differentNewPassword             : String = "Old Password and new password must be different!"
    static let differentConfirmNewPassword        : String = "New Password and confirm password must be same!"
    static let validOtp                           : String = "Please enter valid OTP."
    
}


struct Device {
    // iDevice detection code
    static let IS_IPAD             = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPHONE           = UIDevice.current.userInterfaceIdiom == .phone
    
    static let SCREEN_WIDTH        = Int(UIScreen.main.bounds.size.width)
    static let SCREEN_HEIGHT       = Int(UIScreen.main.bounds.size.height)
    static let SCREEN_MAX_LENGTH   = Int( max(SCREEN_WIDTH, SCREEN_HEIGHT) )
    static let SCREEN_MIN_LENGTH   = Int( min(SCREEN_WIDTH, SCREEN_HEIGHT) )
    
    static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH  < 568
    static let IS_IPHONE_5         = IS_IPHONE && SCREEN_MAX_LENGTH == 568
    static let IS_IPHONE_6         = IS_IPHONE && SCREEN_MAX_LENGTH == 667
    static let IS_IPHONE_6_OR_GREATER = IS_IPHONE && SCREEN_MAX_LENGTH >= 667
    static let IS_IPHONE_6P        = IS_IPHONE && SCREEN_MAX_LENGTH == 736
    static let IS_IPHONE_X         = IS_IPHONE && SCREEN_MAX_LENGTH == 812
    
    
    static let DEVICE_TOKEN         = Common.getStringValueFromAPIValue(apiValue: UserDefaults.standard.object(forKey: UserDefaultsKey.FCMToken), defaultValue: "")
    static let DEVICE_UUID          = Common.getStringValueFromAPIValue(apiValue: UIDevice.current.identifierForVendor?.uuidString, defaultValue: "")
    static let DEVICE_NAME          = Common.getStringValueFromAPIValue(apiValue: UIDevice.current.name, defaultValue: "")
    static let DEVICE_TYPE          = "iOS"
}

enum ApiStatus: Int {
    case falure = 0
    case success = 1
    case tokenExpire = 498
    case missingParameter = 404
}


