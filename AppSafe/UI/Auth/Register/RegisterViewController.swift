//
//  ViewController.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/1/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import UIKit
import PopupDialog

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtPassWord: TextFieldUnderLine!
    
    @IBOutlet weak var btnOK: ButtonRoundColor!
    
    @IBOutlet weak var btnRemove: ButtonRoundColor!
    
    lazy var registerVM:RegisterViewModel = {
        let registerVM_ = RegisterViewModel()
        registerVM_.statusApi = self
        return registerVM_
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupView(){
        btnRemove.isHidden = true
        btnOK.isHidden = true
    }

    @IBAction func onClickOne(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "1")
    }
    
    @IBAction func onClickTwo(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "2")
    }
    
    @IBAction func onClickThree(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "3")
    }
    
    @IBAction func onClickFour(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "4")
    }
    
    @IBAction func onClickFive(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "5")
    }
    
    @IBAction func onClickSix(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "6")
    }
    
    @IBAction func onClickSeven(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "7")
    }
    
    @IBAction func onClickEight(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "8")
    }
    
    @IBAction func onClickNine(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "9")
    }
    
    @IBAction func onClickOK(_ sender: Any) {
        let title = "MẬT MÃ MỚI"
        let message = "Bạn vừa tạo mật mã mới cho lần đăng nhập tiếp theo.\n Bạn có muốn tiếp tục?"
        let popup = PopupDialog(title: title, message: message)
        
        let buttonOne = CancelButton(title: "CANCEL") {}
        
        let buttonTwo = DefaultButton(title: "OK", dismissOnTap: false) {
            let password = self.txtPassWord.text!
            self.registerVM.registerUser(RegisterBody(password: password))
            popup.dismiss()
        }
        
        popup.buttonAlignment = . horizontal
        popup.addButtons([buttonOne, buttonTwo])
        
        self.present(popup, animated: true, completion: nil)
    }
    
    @IBAction func onClickZero(_ sender: Any) {
        let currentPass = txtPassWord.text!
        onClickEvent(currentPass, "0")
    }
    
    @IBAction func onClickRemove(_ sender: Any) {
        let strPass = txtPassWord.text!
        let currentPass = strPass.prefix(strPass.count-1)
        
        if(strPass.count-2 < 5) {
            btnOK.isHidden = true
        }
        
        if(strPass.count-1 > 0) {
            txtPassWord.text = String(currentPass)
        } else {
            btnRemove.isHidden = true
            txtPassWord.text = String(currentPass)
        }
    }
    
    private func onClickEvent(_ pass: String, _ number: String) {
        btnRemove.isHidden = false
        txtPassWord.text = pass + number
        
        if(pass.count > 4) {
             btnOK.isHidden = false
        }
    }
}

extension RegisterViewController : StatusApi {
    func Loading() {
        print("loading")
    }
    
    func Success(data: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
//        let res = data as? RegisterResponse
//        print("data of \(String(describing: res?.token!))")
    }
    
    func Error(error: BaseResponseError) {
        print("loi rj")
    }
    
    
}
