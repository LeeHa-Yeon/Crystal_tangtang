//
//  HomeViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/21.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {
    
    let foodanimationView = AnimationView(name:"fork_knife")
    let playanimationView = AnimationView(name:"gamepad")
    let useranimationView = AnimationView(name:"user")

    @IBOutlet weak var foodView: UIView!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var userView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        foodView.addSubview(foodanimationView)
        playView.addSubview(playanimationView)
        userView.addSubview(useranimationView)
        
        foodanimationView.frame = CGRect(x:10, y:44, width:94, height:88)
        // foodanimationView.frame = foodanimationView.superview!.bounds
        foodanimationView.contentMode = .scaleAspectFit
        foodanimationView.play()
        foodanimationView.loopMode = .loop
        
        playanimationView.frame = CGRect(x:10, y:44, width:94, height:88)
        // playanimationView.frame = playanimationView.superview!.bounds
        playanimationView.contentMode = .scaleAspectFit
        playanimationView.play()
        playanimationView.loopMode = .loop
        
        useranimationView.frame = CGRect(x:18, y:48, width:94, height:88)
        // useranimationView.frame = useranimationView.superview!.bounds
        useranimationView.contentMode = .scaleAspectFit
        useranimationView.play()
        useranimationView.loopMode = .loop

        
        
        
    }
    


}
