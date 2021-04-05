//
//  UserInfo.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/05.
//
//딕셔너리형태로 저장함.
//너가 저장하고픈 사용자정보가 뭐야
//이메일 프로필url ,이름, 생일.

import UIKit

struct UserInfo {
    let email : String
    let profileImageUrl : String
    let name : String
    let birth : String
    
    var toDictionary : [String : Any] {
        let dict : [String : Any] = ["":""]
        
        return dict
    }
    
    init(email : String, profileImageUrl : String, name : String, birth : String){
        self.email = email
        self.profileImageUrl = profileImageUrl
        self.name = name
        self.birth = birth
    }
}
