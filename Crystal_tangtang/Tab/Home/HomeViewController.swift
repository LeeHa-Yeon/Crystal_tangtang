//
//  HomeViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/21.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {
    
    let animationView = AnimationView(name:"fork_knife")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(animationView)
        animationView.frame = CGRect(x:0, y:0, width:500, height:300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill

    }
    


}
