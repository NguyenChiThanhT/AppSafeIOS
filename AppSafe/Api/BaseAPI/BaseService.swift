//
//  BaseSevice.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
class BaseService {
    
    static func requestJsonRx<T: Mappable>(api: APIRouter,_ returnType: T.Type,completion: @escaping (_ error: BaseResponseError?) -> Void) -> Observable<[String:Any]> {
        return Observable.create({ observer -> Disposable in
            let request = Alamofire.request(api).responseObject{ (response:DataResponse<BaseResponse<T>>) in
                switch response.result {
                case .success(let resJson):
                   
                    guard response.response?.statusCode == 200 else {
                        let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, (response.response?.statusCode)!, "Request is error!")
                        completion(err)
                        return
                    }
                    
                    guard (response.result.value?.isSuccessCode())! else {
                        let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.API_ERROR, (response.result.value?.code)!, (response.result.value?.message)!)
                        completion(err)
                        return
                    }
                    
                    let json = resJson.data!.toJSON()
                    observer.onNext(json)
                    observer.onCompleted()
                    
                case .failure(let error):
                    if error is AFError {
                        let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, error._code, "Request is error!")
                        completion(err)
                    }
                }
            }
            return Disposables.create {
                request.cancel()
            }
        })
    }
}
