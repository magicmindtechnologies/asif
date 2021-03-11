//
//  ImagePicker.swift
//  SettingNeeds
//
//  Created by Magicmind on 15/06/20.
//  Copyright © 2020 Magicmind. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices
import CropViewController



typealias ImageCompletionBlock = ( _ isCompleted:Bool,  _ userInfo: [String : Any]) -> Void
typealias ImageDeletionBlock = (_ isDeleted:Bool) -> Void

class ImagePicker: NSObject {
    
    static let sharedInstance   = ImagePicker()
    var completionBlock: ImageCompletionBlock?
    var deletionBlock: ImageDeletionBlock?
    
    // MARK: - Save And Delete Image To Document Directory
    
    public func saveImageToDocumentDirectory(image: UIImage, imageName: String, compressionQuality: CGFloat) {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        let imageData = image.jpegData(compressionQuality: compressionQuality)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        
    }
    
    public func saveVideoToDocumentDirectory(videoURL: URL, videoName: String) {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(videoName)
        let videoData = try! Data(contentsOf: videoURL as URL)
        fileManager.createFile(atPath: paths as String, contents: videoData, attributes: nil)
    }
    
    public func getImageFromDocumentDirectory(imageName: String)-> UIImage?{
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: paths){
            return UIImage(contentsOfFile: paths)!
        } else {
            return nil
        }
    }
    
    public func deleteImageFromDocumentDirectory(filename: String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(filename)
        if fileManager.fileExists(atPath: paths){
            try! fileManager.removeItem(atPath: paths)
            print("Deleted Succesfully!")
        } else {
            print("File not Exist for Deletion!")
        }
    }
    
    func deleteAllFilesFromDocumentDirectory(){
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        guard let items = try? FileManager.default.contentsOfDirectory(atPath: path) else { return }
        
        for item in items {
            // This can be made better by using pathComponent
            let completePath = path.appending("/").appending(item)
            try? FileManager.default.removeItem(atPath: completePath)
        }
    }
    
    public func getDirectoryPathWithFileName(filename: String) -> String? {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(filename)
        if fileManager.fileExists(atPath: paths){
            return paths
        } else {
            return nil
        }
    }
    
    // MARK: - Open ImagePicker
    
    class func openImagePickerOnViewController(vc: UIViewController, isVideo: Bool, completionhandler:@escaping ImageCompletionBlock, deletionhandler: ImageDeletionBlock? = nil){
        
        self.sharedInstance.completionBlock = completionhandler
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let takeAction = UIAlertAction(title: isVideo ? DefaultMessages.takeVideo : DefaultMessages.takePhoto, style: .default) { (alertAction) in
            self.sharedInstance.openCamera(vc: vc, isVideo: isVideo)
        }
        alertController.addAction(takeAction)
        
        
        if !isVideo {
            let takeAction = UIAlertAction(title: DefaultMessages.takePhoto, style: .default) { (alertAction) in
                self.sharedInstance.openCamera(vc: vc, isVideo: isVideo)
            }
            alertController.addAction(takeAction)
        }
        
        
        let chooseAction = UIAlertAction(title: isVideo ? DefaultMessages.chooseVideo : DefaultMessages.choosePhoto, style: .default) { (alertAction) in
            self.sharedInstance.openPhotoLibrary(vc: vc, isVideo: isVideo)
        }
        alertController.addAction(chooseAction)
        
        if let dHandler = deletionhandler  {
            let deleteHandle = UIAlertAction(title: isVideo ? DefaultMessages.removeVideo : DefaultMessages.removePhoto, style: .default) { (alertAction) in
                dHandler(true);
            }
            alertController.addAction(deleteHandle)
        }
        
        let cancelAction = UIAlertAction(title: DefaultMessages.cancel, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popoverPresentationController = alertController.popoverPresentationController {
                popoverPresentationController.sourceView = vc.view
                popoverPresentationController.permittedArrowDirections = []
                popoverPresentationController.sourceRect = CGRect(x: (vc.view.bounds.midX), y: (vc.view.bounds.midY), width: 0, height: 0)
            }
            vc.present(alertController, animated: true, completion: nil)
            
        } else {
            vc.present(alertController, animated: true, completion: nil)
        }
    }
    
    func openCamera(vc: UIViewController, isVideo: Bool) {
        if self.checkCameraAuthorization(vc: vc){
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let picker = UIImagePickerController()
                picker.allowsEditing = isVideo ? true : false
                picker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
                picker.sourceType = .camera
                picker.mediaTypes = isVideo ? [kUTTypeMovie as String] : [kUTTypeImage as String]
                picker.videoMaximumDuration = 360.0
                vc.present(picker, animated: true, completion: nil)
            }
        }
    }
    
    func openPhotoLibrary(vc: UIViewController, isVideo: Bool) {
        if self.checkPhotoLibraryAuthorization(vc: vc){
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let picker = UIImagePickerController()
                picker.allowsEditing = isVideo ? true : false
                picker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
                picker.sourceType = .photoLibrary
                picker.mediaTypes = isVideo ? [kUTTypeMovie as String] : [kUTTypeImage as String]
                picker.videoMaximumDuration = 360.0
                vc.present(picker, animated: true, completion: nil)
            }
        }
    }
    
    public func checkCameraAuthorization(vc: UIViewController) -> Bool {
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
            return true
        } else if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.notDetermined{
            return true
        } else {
            ImagePicker.showAlertForCameraAndPhotoAuthorization(vc: vc, isCamera: true)
            return false
        }
    }
    
    public func checkPhotoLibraryAuthorization(vc: UIViewController) -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            return true
        case .denied, .restricted :
            print("denied")
            ImagePicker.showAlertForCameraAndPhotoAuthorization(vc: vc, isCamera: false)
            return false
        case .notDetermined:
            return true
        @unknown default:
            return false
        }
    }
    
    class public func showAlertForCameraAndPhotoAuthorization(vc: UIViewController, isCamera: Bool) {
        
        let alertController = UIAlertController(title: isCamera ? DefaultMessages.unableToAccessCamera: DefaultMessages.unableToAccessPhoto, message: DefaultMessages.enableFromSettings, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: DefaultMessages.settings, style: .default) { (alertAction) in
            if let appSettings = NSURL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings as URL, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(settingsAction)
        
        let cancelAction = UIAlertAction(title: DefaultMessages.cancel, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
}


extension ImagePicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            let cropViewController = CropViewController(image: image)
            
            /* For Square Image*/
            cropViewController.aspectRatioPreset = .presetSquare
            cropViewController.aspectRatioPickerButtonHidden = true
            cropViewController.resetAspectRatioEnabled = false
            
            cropViewController.onDidCropToRect = { (image, cropRect, angle) in
                
                let fileName = String(format:"%F.png",Date().timeIntervalSince1970)
                self.saveImageToDocumentDirectory(image: image, imageName: fileName, compressionQuality: 0.5)
                self.completionBlock!(true, ["fileName": fileName])
                
                // Dismis CropViewController
                cropViewController.dismiss(animated: true, completion: {
                    
                    // Dismis Image Picker
                    picker.dismiss(animated: true, completion: nil)
                })
            }
            picker.present(cropViewController, animated: true, completion: nil)
            
        } else if let url = info[.mediaURL] as? URL {
            
            let fileName = String(format:"%F.mp4",Date().timeIntervalSince1970)
            self.saveVideoToDocumentDirectory(videoURL: url, videoName: fileName)
            self.completionBlock!(true, ["fileName": fileName])
            
            // Dismis Image Picker
            picker.dismiss(animated: true, completion: nil)
        }
    
    }
}

