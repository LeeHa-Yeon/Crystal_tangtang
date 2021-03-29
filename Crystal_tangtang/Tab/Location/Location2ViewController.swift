//
//  Location2ViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/29.
//

import UIKit
import MapKit
import CoreLocation

class Location2ViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate {
    
    // 도봉구
    let dobongLoc = CLLocationCoordinate2D(latitude: 37.6658609, longitude: 127.0317674)
    // 은평구
    let eunpyeongLoc = CLLocationCoordinate2D(latitude: 37.6176125, longitude: 126.9227004)
    // 동대문구
    let dongdaemoonLoc = CLLocationCoordinate2D(latitude: 37.5838012, longitude: 127.0507003)
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    @IBAction func searchButton(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    
    // location manager : location 을 관리할 CLLocationManager
    // 지도 띄우기
    // CLLocationManager: 위치정보와 관련된 이벤트를 처리하는 역할을 하는 객체
    var locationManager: CLLocationManager = CLLocationManager()
    // 내 위치 저장
    var currentLocation: CLLocation!
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager = manager
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myMap.setUserTrackingMode(.follow, animated: true)
        myMap.showsUserLocation = true // 현재 위치에 마커로 표시
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .restricted {
                let alert = UIAlertController(title: "오류 발생", message: "위치 서비스 기능이 꺼져있음", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            } else {
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.delegate = self
                locationManager.requestWhenInUseAuthorization()
            }
        } else {
            let alert = UIAlertController(title: "오류 발생", message: "위치 서비스 제공 불가", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK : 위치 허용 선택했을 때 처리
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined :
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            self.firstSetting()
            break
        case .authorizedAlways:
            self.firstSetting()
            break
        case .restricted :
            break
        case .denied :
            break
        default:
            break
        }
    }
    
    func firstSetting(){
        self.currentLocation = locationManager.location
    }
    
    // MARK : 위도, 경도에 따른 주소 찾기
    func findAddr(lat: CLLocationDegrees, long: CLLocationDegrees){
        let findLocation = CLLocation(latitude: lat, longitude: long)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        
        geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
            if let address: [CLPlacemark] = placemarks {
                var myAdd: String = ""
                if let area: String = address.last?.locality{
                    myAdd += area
                }
                if let name: String = address.last?.name {
                    myAdd += " "
                    myAdd += name
                }
            }
        })
    }
    
    // MARK : 검색한 위치로 이동 & marker 추가
    func setMapView(coordinate: CLLocationCoordinate2D, addr: String){
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta:0.01, longitudeDelta:0.01))
        self.myMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = addr
        self.myMap.addAnnotation(annotation)
        
        self.findAddr(lat: coordinate.latitude, long: coordinate.longitude)
    }
    
}


/*


 import UIKit
 import MapKit
 import CoreLocation

 class Location2ViewController: UIViewController, CLLocationManagerDelegate {
     
     
     @IBOutlet weak var myMap: MKMapView!
     @IBOutlet weak var lblLocationInfo1: UILabel!
     @IBOutlet weak var lblLocationInfo2: UILabel!
     
     // location manager
     var locationManager: CLLocationManager = CLLocationManager()
     // 내 위치 저장
     var currentLocation: CLLocation!
     
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
             locationManager = manager
             if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                 currentLocation = locationManager.location
             }
         }
     

     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         self.myMap.setUserTrackingMode(.follow, animated: true)
         
 //        lblLocationInfo1.text = ""
 //        lblLocationInfo2.text = ""
 //        locationManager.delegate = self
 //        // 정확도를 최고로 설정
 //        locationManager.desiredAccuracy = kCLLocationAccuracyBest
 //        // 위치 데이터를 추적하기 위해 사용자에게 승인 요구
 //        locationManager.requestWhenInUseAuthorization()
 //        // 위치 업데이트를 시작
 //        locationManager.startUpdatingLocation()
 //        // 위치 보기 설정
         myMap.showsUserLocation = true
         
     }
     
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
         self.lblLocationInfo1.text = ""
         self.lblLocationInfo2.text = ""
         locationManager.startUpdatingLocation()
     }
     
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         
         if CLLocationManager.locationServicesEnabled() {
             if CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .restricted {
                 let alert = UIAlertController(title: "오류 발생", message: "위치 서비스 기능이 꺼져있음", preferredStyle: .alert)
                 let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                 alert.addAction(okAction)
                 self.present(alert, animated: true, completion: nil)
             } else {
                 locationManager.desiredAccuracy = kCLLocationAccuracyBest
                 locationManager.delegate = self
                 locationManager.requestWhenInUseAuthorization()
             }
         } else {
             let alert = UIAlertController(title: "오류 발생", message: "위치 서비스 제공 불가", preferredStyle: .alert)
             let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
             alert.addAction(okAction)
             self.present(alert, animated: true, completion: nil)
         }
     }
     
     // 위도와 경도, 스팬(영역 폭)을 입력받아 지도에 표시
     func goLocation(latitudeValue: CLLocationDegrees,
                     longtudeValue: CLLocationDegrees,
                     delta span: Double) -> CLLocationCoordinate2D {
         let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
         let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
         let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
         myMap.setRegion(pRegion, animated: true)
         return pLocation
     }
     
     // 특정 위도와 경도에 핀 설치하고 핀에 타이틀과 서브 타이틀의 문자열 표시
     func setAnnotation(latitudeValue: CLLocationDegrees,
                        longitudeValue: CLLocationDegrees,
                        delta span :Double,
                        title strTitle: String,
                        subtitle strSubTitle:String){
         let annotation = MKPointAnnotation()
         annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
         annotation.title = strTitle
         annotation.subtitle = strSubTitle
         myMap.addAnnotation(annotation)
     }
     
     
 //    // 위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
 //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
 //        let pLocation = locations.last
 //        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
 //                       longtudeValue: (pLocation?.coordinate.longitude)!,
 //                       delta: 0.01)
 //
 //        locationManager = manager
 //        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
 //            currentLocation = locationManager.location
 //        }
 //        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
 //            let pm = placemarks!.first
 //            let country = pm!.country
 //            var address: String = ""
 //            if country != nil {
 //                address = country!
 //            }
 //            if pm!.locality != nil {
 //                address += " "
 //                address += pm!.locality!
 //            }
 //            if pm!.thoroughfare != nil {
 //                address += " "
 //                address += pm!.thoroughfare!
 //            }
 //            self.lblLocationInfo1.text = "현재 위치"
 //            self.lblLocationInfo2.text = address
 //        })
 //        locationManager.stopUpdatingLocation()
 //    }
 //
     // MARK : 위치 허용 선택했을 때 처리
     func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
         switch status {
         case .notDetermined :
             manager.requestWhenInUseAuthorization()
             break
         case .authorizedWhenInUse:
             self.firstSetting()
             break
         case .authorizedAlways:
             self.firstSetting()
             break
         case .restricted :
             break
         case .denied :
             break
         default:
             break
         }
     }
     
     func firstSetting(){
         self.currentLocation = locationManager.location
     }
     
     
 }

 */
