//
//  LoginViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/20.
//

import UIKit
import KakaoSDKUser

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func kakaoLoginButton(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    
                    // 화면 이동
                    let board = UIStoryboard(name: "Master", bundle: nil)
                    let vc = board.instantiateViewController(withIdentifier: "MasterViewController")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)


                    
//                    let mvc = UIStoryboard(name: "Master", bundle: nil).instantiateViewController(withIdentifier: "MasterViewController")
//                                    self.present(mvc, animated: true)
                    print("login With KakaoAccount() success.")

                    _ = oauthToken
                }
            }
    }
    
    @IBAction func appleLoginButton(_ sender: Any) {
        
        print(" 애플 로그인 ")
    }
}
