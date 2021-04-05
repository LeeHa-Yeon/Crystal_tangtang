//
//  MapViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/04.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate {

    // 도봉구
    let dobongLoc = CLLocationCoordinate2D(latitude: 37.6658609, longitude: 127.0317674)
    // 은평구
    let eunpyeongLoc = CLLocationCoordinate2D(latitude: 37.6176125, longitude: 126.9227004)
    // 동대문구
    let dongdaemoonLoc = CLLocationCoordinate2D(latitude: 37.5838012, longitude: 127.0507003)
    
    @IBOutlet weak var my2Map: MKMapView!
    
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
        
        title = " 현재 위치 가져오기 "
        self.my2Map.setUserTrackingMode(.follow, animated: true)
        my2Map.showsUserLocation = true // 현재 위치에 마커로 표시

        
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
        self.my2Map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = addr
        self.my2Map.addAnnotation(annotation)
        
        self.findAddr(lat: coordinate.latitude, long: coordinate.longitude)
    }

}
