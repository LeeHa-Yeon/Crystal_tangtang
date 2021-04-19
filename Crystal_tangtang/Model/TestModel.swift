//
//  TestModel.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/20.
//

import UIKit

struct TestModel : Codable {
    let testName : String
    
    init (testName : String) {
        self.testName = testName
    }
    
    var toDictionary : [String:Any] {
        let dict : [String : Any] = ["testName":self.testName]
        
        return dict
    }
}
