//
//  RegisterResponse.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation
import ObjectMapper

class RegisterResponse:  Mappable{
     var token : String?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map["token"]
    }
}
