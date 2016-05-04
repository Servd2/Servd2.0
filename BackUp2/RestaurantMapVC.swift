//
//  RestaurantMapVC.swift
//  DummyServdDifferent
//
//  Created by Saul Soto on 5/1/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import UIKit
import MapKit

class RestaurantMapVC: UIViewController {

    @IBOutlet weak var mapview: MKMapView!
    
    let initialLocation = CLLocation(latitude: 40.861580, longitude: -73.886211)
    
    let regionRadius: CLLocationDistance = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //mapview.mapType = MKMapType.Satellite;
        centerMapOnLocation(initialLocation)
        
        //mapview.delegate = self
        
        let campusLocation = LocationsPins(title: "Fordham University", coordinate: CLLocationCoordinate2D(latitude: 40.861580/*-73.887390126939*/, longitude: -73.886211/*40.86125886238194*/), info: "College University.")
        let grillLocation = LocationsPins(title: "The Grill", coordinate: CLLocationCoordinate2D(latitude: 40.859339, longitude: -73.882577), info: "Food Place.")
        let cosiLocation = LocationsPins(title: "Cosi", coordinate: CLLocationCoordinate2D(latitude: 40.858489, longitude: -73.882976), info: "Food Place.")
        
        /*let artwork = Artwork(title: "Fordham University",
            locationName: "Rose Hill Campus",
            discipline: "campus",
            coordinate: CLLocationCoordinate2D(latitude: -73.887390126939, longitude: 40.86125886238194))*/
        
        mapview.addAnnotation(campusLocation)//artwork)
        mapview.addAnnotation(grillLocation)
        mapview.addAnnotation(cosiLocation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapview.setRegion(coordinateRegion, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
