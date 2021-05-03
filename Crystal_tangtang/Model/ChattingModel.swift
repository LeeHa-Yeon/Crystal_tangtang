//
//  ChattingModel.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/27.
//

import UIKit

struct ChattingModel : Codable {
    let RoomName : String
    
    init (RoomName : String) {
        self.RoomName = RoomName
    }
    
    var toDictionary : [String:Any] {
        let dict : [String : Any] = ["RoomName":self.RoomName]
        
        return dict
    }
}
