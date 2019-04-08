//
//  UserRepo.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation
import RxSwift

class UserRepo: BaseService {
    
    static func registerUser(registerBody:RegisterBody,completion: @escaping (_ error: BaseResponseError?) -> Void) -> Observable<RegisterResponse> {
        return requestJsonRx(
            api: .register(registerBody: registerBody),
            RegisterResponse.self,
            completion: {error in completion(error)}).map({ json in
                let book = RegisterResponse(JSON: json)
                return book!
            })
    }
}
