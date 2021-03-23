//
//  LocationViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/22.
//

import UIKit
import NMapsMap


class LocationViewController: UIViewController {

    
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    var mapView : NMFMapView {
        return naverMapView.mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
