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
import CoreLocation

class LocationViewController: UIViewController {
    
    let requestUrl : String = "https://dapi.kakao.com/v2/local/search/keyword.json?"
    let KAKAO_HEADER : String = "Authorization"
    let KAKAO_REST_API_KEY : String = "KakaoAK 4b9f0ab333b19efe47acd6e5253d4e3e"
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    var mapView : NMFMapView {
        return naverMapView.mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !requestGPSPermission(){
            locationManager.requestAlwaysAuthorization()
        }
        
        naverMapView.showLocationButton = true
        mapView.positionMode = .compass
    }
    
    // 생명주기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.async {
            self.mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(NMGLatLng(lat: self.mapView.locationOverlay.location.lat, lng: self.mapView.locationOverlay.location.lng), zoom: 15)))
        }
    }
    
    
    @IBAction func nowLocationButton(_ sender: Any) {
        
    }
    
    func requestGPSPermission() -> Bool {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS: 권한 있음")
            return true
        case .restricted, .notDetermined:
            print("GPS: 아직 선택하지 않음")
            return false
        case .denied:
            print("GPS: 권한 없음")
            return false
        default:
            print("GPS: Default")
            return false
        }
    }
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
    

