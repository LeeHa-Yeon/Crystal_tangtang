//
//  LoadingViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/21.
//

import UIKit
import Lottie
import KakaoSDKAuth

class LoadingViewController: UIViewController {
    
    
    //Lottie AnimationView 생성
    let animationView = AnimationView(name:"loadingAnimation")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketIOManager.shared.establishConnection()
        //메인 뷰에 삽입
        view.addSubview(animationView)
        animationView.frame = CGRect(x:0, y:0, width:500, height:300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.play()//애니메이션 재생(애니메이션 재생모드 미 설정시 1회)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //애니메이션 시간 후에 작동하게끔.
        let time = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.animationView.pause()
            if AuthApi.hasToken() {
                let board = UIStoryboard(name: "Master", bundle: nil)
                let vc = board.instantiateViewController(withIdentifier: "MasterViewController")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                //유저정보 저장 왜안했어 !
            }
            else {
                let board = UIStoryboard(name: "Login", bundle: nil)
                let vc = board.instantiateViewController(withIdentifier: "LoginViewController")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                //ㅇㅋ
            }
        }
    }
}

//화면의 이동은 viewDidLoad에서 하면 안됨
// 저친구는 뷰 불러오려고 준비중인 아이. ㅇㅇ 그래서 will에서 해야함
// whose view is not in the window hierarchy. 이 에러가 검색해보면 뷰의 윈도우 계층에 없는아이라고 떠
//나도 이걸로 에러 냄 ㅎ


