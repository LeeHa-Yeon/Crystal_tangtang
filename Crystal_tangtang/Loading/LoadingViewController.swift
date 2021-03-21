//
//  LoadingViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/21.
//

import UIKit
import Lottie

class LoadingViewController: UIViewController {
    
    //Lottie AnimationView 생성
    let animationView = AnimationView(name:"loadingAnimation")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //메인 뷰에 삽입
        view.addSubview(animationView)
        animationView.frame = CGRect(x:0, y:0, width:500, height:300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill

//        animationView.frame = animationView.superview!.bounds
//        animationView.contentMode = .scaleAspectFit

        
        //애니메이션 재생(애니메이션 재생모드 미 설정시 1회)
        animationView.play()

        //애니메이션 재생모드( .loop = 애니메이션 무한재생)
        animationView.loopMode = .loop

        //애니메이션 종료
        //animationView.pause()

    }
    
    

}
