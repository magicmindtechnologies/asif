//
//  APICalling.swift
//  LeapingFeet
//
//  Created by Magicmind on 02/09/20.
//  Copyright © 2020 Magicmind. All rights reserved.
//

import Foundation
import Alamofire

let BASE_URL = "https://onlinedancerstudio.com/new/?page_id=11149"
let PRIVACY_URL = "https://onlinedancerstudio.com/new/privacy-policy/"
let TERMS_URL = "https://onlinedancerstudio.com/new/terms-conditions/"


func getHeader(header: HeaderData) -> HTTPHeaders? {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    var headerData: Data?
    do {
        headerData = try encoder.encode(header)
    } catch  {
        return nil
    }
    
    guard headerData != nil else{
        return nil
    }
    
    var headers: HTTPHeaders?
    do {
        guard let data = try JSONSerialization.jsonObject(with: headerData!, options: []) as? [String: String] else{
            
            return nil
        }
        headers = HTTPHeaders(data)
    } catch {
        return nil
    }
    
    return headers
}

func getParams<U:RequestData>(request: U) -> [String: Any]? {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    var paramData: Data?
    do {
        paramData = try encoder.encode(request)
    } catch  {
        return nil
    }
    
    guard paramData != nil else{
        return nil
    }
    
    var params: Parameters?
    do {
        params = try JSONSerialization.jsonObject(with: paramData!, options: []) as? [String: Any]
    } catch {
        return nil
    }
    
    return params
}

func callAPI<T,U:RequestData>(header: HeaderData, request: U, _ completion: @escaping (Response<T>?) -> Void) {
 
    guard let headers = getHeader(header: header) else{
        completion(nil)
        return
    }

    guard let params = getParams(request: request) else{
        completion(nil)
        return
    }
    
    print("HEADER :", headers)
    print("PARAMETER :",params)
    
    let request = AF.request(BASE_URL, method: .post, parameters: params, headers: headers)
    
    /*
    request.responseJSON { (response) in
        guard let res = response.value as? [String: Any] else {
            completion(nil)
            return }
        print(res)
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
            
            let decoder = JSONDecoder()
            
            do {
                let responseData = try decoder.decode(Response<T>.self, from: jsonData)
                completion(responseData)
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }
        } catch  {
            print(error.localizedDescription)
            completion(nil)
            return
        }
    }*/
    
    request.responseDecodable(of: Response<T>.self) { (response) in
        guard let res = response.value else {
            completion(nil)
            return }
        completion(res)
        
    }
}


func callAPIMultipart<T,U:RequestData>(header: HeaderData, request: U, _ completion: @escaping (Response<T>?) -> Void){
    
    guard var headers = getHeader(header: header) else{
        completion(nil)
        return
    }
    
    headers["Content-type"] = "multipart/form-data"
    headers["Accept"] = "application/json"
    
    guard var params = getParams(request: request) else{
        completion(nil)
        return
    }
    
    print("HEADER :", headers)
    print("PARAMETER :",params)
    
    let request = AF.upload(multipartFormData: { multipartFormData in
        
        if let image = params["image"] as? String, !image.isEmpty {
            let fileUrl = URL(fileURLWithPath: ImagePicker.sharedInstance.getDirectoryPathWithFileName(filename: image)!)
            multipartFormData.append(fileUrl, withName: "image", fileName: fileUrl.lastPathComponent, mimeType: "image/png")
            params.removeValue(forKey: "image") // Removed key-value as its append with multipart
        }
        
        if let video = params["video"] as? String, !video.isEmpty {
                    
            let fileUrl = URL(fileURLWithPath: ImagePicker.sharedInstance.getDirectoryPathWithFileName(filename: video)!)
            multipartFormData.append(fileUrl, withName: "video", fileName: fileUrl.lastPathComponent, mimeType: "video/mp4")
            params.removeValue(forKey: "video") // Removed key-value as its append with multipart
        }
        
        for (key, value) in params {
            multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
        }
    }, to: BASE_URL, usingThreshold: UInt64.init(), method: .post, headers: headers)
     
    /*
    request.responseJSON { (response) in
        guard let res = response.value as? [String: Any] else {
            completion(nil)
            return }
        print(res)
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)

            let decoder = JSONDecoder()

            do {
                let responseData = try decoder.decode(Response<T>.self, from: jsonData)
                completion(responseData)
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }
        } catch  {
            print(error.localizedDescription)
            completion(nil)
            return
        }
    } */
    
    
            
    request.responseDecodable(of: Response<T>.self) { (response) in
        guard let res = response.value else {
            completion(nil)
            return
        }
        completion(res)
        
//        switch response.result {
//        case .success(let result):
//            completion(result)
//        case .failure(let error):
//            Common.showError(message: error.localizedDescription)
//            completion(nil)
//        }
    }
}
