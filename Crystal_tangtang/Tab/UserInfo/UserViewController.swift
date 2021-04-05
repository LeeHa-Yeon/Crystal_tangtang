//
//  UserViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/21.
//

import UIKit
import KakaoSDKUser
import Kingfisher

class UserViewController: UIViewController {
    
    
    var profileURL : String = ""
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nicnameLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserApi.shared.me() { [self](user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                self.emailLabel.text = "\((user?.kakaoAccount?.email)!)"
                self.nicnameLabel.text = "\((user?.kakaoAccount?.profile?.nickname)!)"
                self.birthLabel.text = "\((user?.kakaoAccount?.birthday)!)"
                self.profileURL = "\((user?.kakaoAccount?.profile?.profileImageUrl)!)"
                //do something
                _ = user
            }
        }
        initViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func initViews(){
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
        profileImage.layer.masksToBounds = true
        
    }
    
    @IBAction func testButton(_ sender: Any) {
        DispatchQueue.main.async {
            let url = URL(string: (self.profileURL))
            self.profileImage.kf.setImage(with: url)
        }
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

/*
 import UIKit

 class MainViewController: UIViewController {
   
   let emailLabel: UILabel = {
     let label = UILabel()
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
   }()
   
   let nicnameLabel: UILabel = {
     let label = UILabel()
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
   }()
   
   private let logoutButton: UIButton = {
     let button = UIButton(type: .system)
     button.setTitle("로그아웃", for: .normal)
     button.addTarget(self, action: #selector(touchUpLogoutButton(_:)), for: .touchUpInside)
     button.translatesAutoresizingMaskIntoConstraints = false
     return button
   }()
   
   override func viewDidLoad() {
     super.viewDidLoad()
     view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
     layout()
   }
   
   @objc private func touchUpLogoutButton(_ sender: UIButton) {
     guard let session = KOSession.shared() else { return }
     session.logoutAndClose { (success, error) in
       if success {
         print("logout success.")
         self.dismiss(animated: true, completion: nil)
       } else {
         print(error?.localizedDescription)
       }
     }
   }
   
   private func layout() {
     let guide = view.safeAreaLayoutGuide
     view.addSubview(emailLabel)
     emailLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30).isActive = true
     emailLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
     
     view.addSubview(nicnameLabel)
     nicnameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30).isActive = true
     nicnameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
     
     view.addSubview(logoutButton)
     logoutButton.topAnchor.constraint(equalTo: nicnameLabel.bottomAnchor, constant: 30).isActive = true
     logoutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
   }
 }
 */
