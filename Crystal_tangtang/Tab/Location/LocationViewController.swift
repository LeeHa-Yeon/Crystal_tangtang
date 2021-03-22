//
//  LocationViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/22.
//

import UIKit
import NMapsMap

class LocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)

    }

}
