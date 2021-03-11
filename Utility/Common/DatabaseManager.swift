//
//  DatabaseManager.swift
//  LeapingFeet
//
//  Created by Magicmind on 12/08/20.
//  Copyright © 2020 Magicmind. All rights reserved.
//

import Foundation
import MagicalRecord

class DatabaseManager: NSObject {
    
    class func saveDB() {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    /*User Data*/
    class func getUserData() -> UserDetails? {
        let userData = UserDetails.mr_findFirst()
        return userData
    }
    
    
    class var isLoggedIn : Bool {
        if let user = getUserData(), let email = user.email, !email.isEmpty {
            return true
        }
        return false
    }
    
    class var userId : String {
        if let user = getUserData(), let userId = user.userId, !userId.isEmpty {
            return userId
        }
        return ""
    }
    
    class var token : String {
        if let user = getUserData(), let token = user.token, !token.isEmpty {
            return token
        }
        return ""
    }
    
    
    
    class func clearAllLocalData() {
        UserDetails.mr_truncateAll()
        self.saveDB()
    }
    
    class func updateUserInfoForKey(strKey: String, strValue: String) {
        var userData = UserDetails.mr_findFirst()
        if userData == nil {
            userData = UserDetails.mr_createEntity()
        }
        userData?.setValue(strValue, forKey: strKey)
        self.saveDB()
    }
    
//    class func updateUserInfo(data: LoginResponse?) {
//        
//        if let userDetails = data {
//            
//            var userData = UserDetails.mr_findFirst()
//            if userData == nil {
//                userData = UserDetails.mr_createEntity()
//            }
//            
//            userData?.token = userDetails.token
//            
//            let profileImage = Common.getStringValueFromAPIValue(apiValue: userDetails.profileImage, defaultValue: "")
//            let profilePicEncoding = profileImage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//            userData?.profileImage = profilePicEncoding
//            
//            let userId = Common.getStringValueFromAPIValue(apiValue: userDetails.userID, defaultValue: "")
//            var countryCode = Common.getStringValueFromAPIValue(apiValue: userDetails.countryCode, defaultValue: "")
//            let isPlusAdded = countryCode.contains("+")
//            if !isPlusAdded {
//                countryCode = "+" + countryCode
//            }
//            
//            print("TOKEN : ", userDetails.token ?? "")
//            
//            userData?.userId =  userId
//            userData?.firstName = userDetails.firstName
//            userData?.lastName = userDetails.lastName
//            userData?.mobile = userDetails.mobile
//            userData?.email = userDetails.email
//            userData?.dob = userDetails.dob 
//            userData?.street = userDetails.street
//            userData?.city = userDetails.city
//            userData?.state = userDetails.state
//            userData?.zip = userDetails.zip
//            userData?.country = userDetails.country
//            userData?.about = userDetails.descriptionOption
//            userData?.gender = userDetails.gender
//            userData?.classOption = userDetails.classOption
//            userData?.danceStyle = userDetails.danceStyle
//            userData?.countryCode = countryCode
//            self.saveDB()
//        }
//    }
    
   
    
}
