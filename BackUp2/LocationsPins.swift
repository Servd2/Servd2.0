//
//  LocationsPins.swift
//  
//
//  Created by Saul Soto on 5/1/16.
//
//

import UIKit
import MapKit

class LocationsPins: NSObject, MKAnnotation {
        var title: String?
        var coordinate: CLLocationCoordinate2D
        var info: String
        
        init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
            self.title = title
            self.coordinate = coordinate
            self.info = info
        }

}
