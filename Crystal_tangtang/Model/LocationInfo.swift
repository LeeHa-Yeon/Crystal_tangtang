//
//  Location4Manager.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/04.
//

import Foundation
import UIKit

struct LocationInfo{
    
    let addressName : String
    let detailAddress : String
    
    // let sheetName : String
    
    init(){
        // self.sheetName = "defaultName"
        self.addressName = "서울시 종로구 난계로 241"
        self.detailAddress = "ibc오피스텔"
    }
}

class Location4Manager {
    static let shared = Location4Manager()
    
    // 최근 주소 리스트
    var recentAddressList : [LocationInfo] = []
    // var sheetInfoList : [LocationInfo] = []
    
    //1. 하나의 객체 생성
    func createAddressSheetInfo() -> LocationInfo {
        return LocationInfo()
    }
    //2. 그 생성한 객체를 리스트에 넣기
    func addAddressSheetInfoList(_ sheetInfo : LocationInfo) {
        recentAddressList.append(sheetInfo)
    }
}

class Location4ListInfoViewModel {
    private let manager = Location4Manager.shared
    
    var recentAddressList : [LocationInfo] {
        return manager.recentAddressList
    }
    
    func createAddressSheetInfo() -> LocationInfo {
        return manager.createAddressSheetInfo()
    }
    
    func addAddressSheetInfoList(sheetInfo : LocationInfo){
        return manager.addAddressSheetInfoList(sheetInfo)
    }
}
