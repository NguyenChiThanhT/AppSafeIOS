//
//  RegisterBody.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation
struct RegisterBody {
    var password: String?
    
    func toParams() -> [String:Any] {
        return [
            "password": password ?? ""
        ]
    }
}
