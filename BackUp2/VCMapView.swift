//
//  VCMapView.swift
//  DummyServdDifferent
//
//  Created by Saul Soto on 5/1/16.
//  Copyright © 2016 CodePath - Servd. All rights reserved.
//

import Foundation
import MapKit

extension RestaurantMapVC: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? Artwork {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
}