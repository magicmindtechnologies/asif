//
//  Validation.swift
//  Eria
//
//  Created by Magicmind on 19/01/21.
//

import UIKit

class Validation {
    
    class func validateEmpty(text: String) -> Bool {
        let updatedText = text.trimWhiteSpacesAndNewLines()
        return !updatedText.isEmpty
    }

    class func validateName(name: String) ->Bool {
       // Length be 18 characters max and 3 characters minimum, you can always modify.
       let nameRegex = "^\\w{3,18}$"
       let trimmedString = name.trimmingCharacters(in: .whitespaces)
       let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
       let isValidateName = validateName.evaluate(with: trimmedString)
       return isValidateName
    }
    
    class func validateEmailId(emailID: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
       let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       let isValidateEmail = validateEmail.evaluate(with: trimmedString)
       return isValidateEmail
    }
    
    class func validatePassword(password: String) -> Bool {
        let trimmedString = password.trimmingCharacters(in: .whitespaces)
        if trimmedString.count >= 6 {
            return true
        } else {
            return false
        }
    }
    
    class func validateNewPassword(oldPassword : String, newPassword : String) -> Bool {
        return oldPassword != newPassword
    }
    
    class func validateConfirmPassword(password : String, confirmPassword : String) -> Bool {
        return password == confirmPassword
    }
}
