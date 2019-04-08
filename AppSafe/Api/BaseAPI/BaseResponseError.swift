//
//  BaseResponseError.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation

class BaseResponseError {
    var mErrorType : NetworkErrorType?
    var mErrorCode : Int?
    var mErrorMessage: String?
    
    init(_ errorType: NetworkErrorType, _ errorCode: Int, _ errorMessage: String) {
        mErrorType = errorType
        mErrorCode = errorCode
        mErrorMessage = errorMessage
    }
}
