//
//  FirebaseTestViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/20.
//

import UIKit
import Firebase
import FirebaseFirestore

class FirebaseTestViewController: UIViewController {
    
    var db : DatabaseReference = Database.database().reference()
    
    //    let db = Firestore.firestore()
    //    let oopsla = ["이하연","이숭인","송정훈","이재웅"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saveTest()
        readFireBaseData()
        
        //        for student in oopsla {
        //            db.collection("oopsla").document(student).setData(["ios":3,"안드로이드":1,"서버":0])
        //        }
        
    }
    
    func saveTest(){
        let test = TestModel(testName: "서경이")
        db.child("New").setValue(test.toDictionary)
    }
    
    func readFireBaseData(){
        
        db.child("New").observeSingleEvent(of: .value) { snapshot in
            if !snapshot.hasChildren()  {
                //데이터가 없으면 해야할 행동
                print("don't have review data")
                return
            }
            do{
                let jsonData = try JSONSerialization.data(withJSONObject: snapshot.value!, options: [])
                let json = try JSONDecoder().decode(TestModel.self, from: jsonData)
                print("--> \(json.testName)")
                
            }catch let error{
                print("parsed error —> \(error.localizedDescription)")
            }
        }
    }
    
    func saveChatting(){
        let test = ChattingModel(RoomName: "룸1")
        db.child("New").setValue(test.toDictionary)
    }
    
    func readChatting(){
        
        db.child("New").observeSingleEvent(of: .value) { snapshot in
            if !snapshot.hasChildren()  {
                //데이터가 없으면 해야할 행동
                print("don't have review data")
                return
            }
            do{
                let jsonData = try JSONSerialization.data(withJSONObject: snapshot.value!, options: [])
                let json = try JSONDecoder().decode(TestModel.self, from: jsonData)
                print("--> \(json.testName)")
                
            }catch let error{
                print("parsed error —> \(error.localizedDescription)")
            }
        }
    }
    
    
    
}
