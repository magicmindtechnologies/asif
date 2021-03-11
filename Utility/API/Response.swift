//
//  Models.swift
//  LeapingFeet
//
//  Created by Magicmind on 02/09/20.
//  Copyright © 2020 Magicmind. All rights reserved.
//

import Foundation

struct HeaderData: Encodable {
   
    var contentType: String = "application/x-www-form-urlencoded"
    var token = ""
    
    enum CodingKeys: String, CodingKey {
        case contentType = "Content-Type"
        case token = "Authorization"
    }
}

protocol RequestData: Encodable {}


struct Response<T: Decodable>: Decodable {
    var status : Bool?
    var message: String?
    var data: T?

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
}



