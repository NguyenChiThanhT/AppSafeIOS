//
//  StatusApi.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation

protocol StatusApi: class {
    func Loading()
    func Success(data: Any)
    func Error(error: BaseResponseError)
}
