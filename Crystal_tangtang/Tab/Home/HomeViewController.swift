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
        
        foodanimationView.frame = foodanimationView.superview!.bounds
        foodanimationView.contentMode = .scaleAspectFill
        foodanimationView.play()
        foodanimationView.loopMode = .loop
        
        playanimationView.frame = playanimationView.superview!.bounds
        playanimationView.contentMode = .scaleAspectFit
        playanimationView.play()
        playanimationView.loopMode = .loop
        
        useranimationView.frame = useranimationView.superview!.bounds
        useranimationView.contentMode = .scaleAspectFit
        useranimationView.play()
        useranimationView.loopMode = .loop

        
        
        
    }
    


}
