//
//  Location3ViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/30.
//

import UIKit
import MapKit
import FloatingPanel
import CoreLocation

class Location3ViewController: UIViewController, SearchViewControllerDelegate {
    
    let mapView  = MKMapView()
    let panel = FloatingPanelController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        title = "iOS MapKit TEST"
        
        let searchVC = SearchViewController()
        searchVC.delegate = self
        
        panel.set(contentViewController: searchVC)
        panel.addPanel(toParent: self)

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
    
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
        
        guard let coordinates = coordinates else {
            return
        }
        
        // panel.dismiss(animated: true, completion: nil)
        panel.move(to: .tip, animated: true)
        
        
        mapView.removeAnnotations(mapView.annotations)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
        
        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
    }
    

}
