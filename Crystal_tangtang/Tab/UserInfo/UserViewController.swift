//
//  UserViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/21.
//

import UIKit
import KakaoSDKUser

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logoutButton(_ sender: Any) {
        
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                let board = UIStoryboard(name: "Login", bundle: nil)
                let vc = board.instantiateViewController(withIdentifier: "LoginViewController")
                self.present(vc, animated: true, completion: nil)
                print("logout() success.")
            }
        }

    }
}
