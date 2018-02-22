//
//  MapViewController.swift
//  TestApp
//
//  Created by takemura on 2018/02/20.
//  Copyright © 2018年 takemura. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let identifier = "pinIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // 井の頭公園周辺の領域を地図上に表示
        var region = MKCoordinateRegion()
        region.center.latitude      = 35.700046
        region.center.longitude     = 139.573078
        region.span.latitudeDelta   = 0.05
        region.span.longitudeDelta  = 0.05
        self.mapView.setRegion(region, animated: true)
        
        let pin : PinAnnotation = PinAnnotation(title: "井の頭公園", subtitle: "桜の名所です", coordinate: region.center)
        self.mapView.addAnnotation(pin)
    }
}

extension MapViewController: MKMapViewDelegate {
    // ピンをタップした際に吹き出しを表示する
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 吹き出しを取得
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: self.identifier)
        
        // 起き出しオブジェクトが空の場合は生成
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
}

class PinAnnotation: NSObject,MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String? = ""
    var subtitle: String? = ""
    
    // 初期化処理
    internal init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
