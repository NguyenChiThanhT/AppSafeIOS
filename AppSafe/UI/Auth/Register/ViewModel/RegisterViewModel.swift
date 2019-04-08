//
//  RegisterViewModel.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation
import RxSwift

class RegisterViewModel:NSObject {
    
    let disposeBag = DisposeBag()
    weak var statusApi: StatusApi?
    
    func registerUser(_ registerBody: RegisterBody) {
         self.statusApi?.Loading()
        UserRepo.registerUser(registerBody: registerBody, completion: {error in self.statusApi?.Error(error: error!)})
            .subscribe(
                onNext: { book in
                    self.statusApi?.Success(data: book)
            }).disposed(by: disposeBag)
    }
   
}

