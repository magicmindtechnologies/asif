//
//  APIList.swift
//  LeapingFeet
//
//  Created by Magicmind on 02/09/20.
//  Copyright © 2020 Magicmind. All rights reserved.
//

import Foundation

enum APIName: String {
    case login = "login"
    case registration = "registration"
    case aboutUs = "aboutus"
    case faq = "faq"
    case forgotPassword = "forgot_password"
    case resetPassword = "reset_password"
    case meetTeam = "meet_team"
    case contactUs = "contact_us"
    case changePassword = "change_password"
    case updateProfile = "edit_profile"
    case logout = "logout"
    case schoolPolices = "school_polices"
    case blog = "blog"
    case countryCode = "countryCode"
    case gallery = "gallery"
    case allTeacher = "all_teacher"
    case emailInstructor = "email_instructor"
    case video = "video_list"
    case songs = "audio_list"
    case videoUpload = "video_upload"
    case timeline = "get_timeline"
    case saveTimeline = "save_timeline"
    case clearTimeline = "clear_timeline"
    case packages = "packages"
    case resendOtp = "resend_otp"
    case classList = "class_list"
    case bookClass = "book_class"
    case notificationList = "notification_list"
    case readNotification = "read_notification"
    case myProfile = "my_profile"
    case feedback = "feedback"
    case deletePhoto = "delete_photo"
}
