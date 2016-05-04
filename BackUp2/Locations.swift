//
//  Locations.swift
//  DummyServdDifferent
//
//  Created by Saul Soto on 5/1/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import Foundation
import MapKit

class Artwork: NSObject, MKAnnotation {
    
    var title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
