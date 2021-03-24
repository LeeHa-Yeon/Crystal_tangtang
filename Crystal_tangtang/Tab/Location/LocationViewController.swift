//
//  LocationViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/22.
//

import UIKit
import NMapsMap
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire


class LocationViewController: UIViewController {
    
    let requestUrl : String = "https://dapi.kakao.com/v2/local/search/keyword.json?"
    let KAKAO_HEADER : String = "Authorization"
    let KAKAO_REST_API_KEY : String = "KakaoAK 4b9f0ab333b19efe47acd6e5253d4e3e"

    
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    var mapView : NMFMapView {
        return naverMapView.mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func nowLocationButton(_ sender: Any) {
        
//        if let lm = NMapLocationManager.getSharedInstance() {
//            // set delegate
//            lm.setDelegate(self)
//
//            // start updating location
//            lm.startContinuousLocationInfo()
//
//            mapView?.setAutoRotateEnabled(true, animate: true)
//
//            // start updating heading
//            lm.startUpdatingHeading()
//        }
    }
    //    func requestRegioncode(param : RegioncodeParam,completion : @escaping (Regioncode)->(Void)){
//            AF.request(RegioncodeRequestUrl,method: .get, parameters: param.toDictionary,headers: [HEADER_KEY : HEADER_VALUE]).validate(statusCode: 200..<300).responseJSON { response in
//                switch response.result {
//                case .success:
//                    do{
//                        let jsonData = try JSONSerialization.data(withJSONObject: response.value!, options: .prettyPrinted)
//                        let json = try JSONDecoder().decode(Regioncode.self, from: jsonData)
//                        completion(json)
//                    }catch let error {
//                        print("parsing error -> \(error.localizedDescription)")
//                    }
//                case .failure:
//                    print("fail , statusCode —> \(response.result)")
//                }
//            }
//        }

}
