//
//  ViewController.swift
//  GeoFence
//
//  Created by Riken Maharjan on 7/18/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate  {

   
    @IBOutlet weak var mapView: MKMapView!
   
   var locationManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.locationManager.requestAlwaysAuthorization()
//        self.locationManager.delegate = self
//        
//        setUpGeofenceForPlayaGrandeBeach()
        
        
    }

//    func setUpGeofenceForPlayaGrandeBeach() {
//        let geofenceRegionCenter = CLLocationCoordinate2DMake(-38.028308, -57.531508);
//        let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter, radius: 400, identifier: "PlayaGrande");
//        geofenceRegion.notifyOnExit = true;
//        geofenceRegion.notifyOnEntry = true;
//        self.locationManager.startMonitoring(for: geofenceRegion)
//    }
//
//
//    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
//        print("Welcome to Playa Grande! If the waves are good, you can try surfing!")
//        //Good place to schedule a local notification
//    }
//    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//        print("Bye! Hope you had a great day at the beach!")
//        //Good place to schedule a local notification
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if (status == CLAuthorizationStatus.authorizedAlways) {
//            self.setUpGeofenceForPlayaGrandeBeach()
//        }
//    }

}

