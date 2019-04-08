//
//  Configs.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation

struct Configs {
    static let BASE_URL: String = "http://192.168.1.253:8081/gumi/appsafe/"
}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
