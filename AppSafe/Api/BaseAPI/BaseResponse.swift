//
//  BaseResponse.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation
import ObjectMapper
class BaseResponse<T: Mappable>: Mappable {
   
    var status: String?
    var code: Int?
    var message: String?
    var data: T?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
    
    func isSuccessCode() -> Bool? {
        return code == 200
    }
    
}
