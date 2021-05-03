//
//  SocketIOManager.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/05/04.
//

import Foundation
import SocketIO
class SocketIOManager:NSObject{
    static let shared = SocketIOManager()
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "/")
    }
    var manager = SocketManager(socketURL: URL(string: "http://172.20.10.9:3000")!, config: [.log(true), .compress])
    var socket : SocketIOClient!
    func establishConnection(){
        socket.connect()
    }
    func closeConnection(){
        socket.disconnect()
    }
   
}
