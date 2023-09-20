//
//  ReportVM.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 14/08/2023.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import CoreLocation

class ReportViewModel: ObservableObject {
    let geoCoder = CLGeocoder() // to make coordinates readable
    let locationManager = CLLocationManager() // initialize manager
    private let ref = Database.database().reference() // root of database
    
    func sendToDatabase(_ report: Report) {
        requestUserLocation() // access user location when report is sent in
        
        let encoder = JSONEncoder() // setup encoder object
        let jsonData = try! encoder.encode(report) // convert to json object
        let newJsonReport = String(data: jsonData, encoding: String.Encoding.utf8) // stringify
        
        ref.child("\(report.id)").setValue(newJsonReport) // push to database with unique ID as key
    }
    
    func requestUserLocation() {
        // get access to location
        locationManager.startMonitoringSignificantLocationChanges() // significant location changes
        locationManager.requestWhenInUseAuthorization()  // ask user for permission
        locationManager.startUpdatingLocation()
        
        // access coordinates for location
        guard let locValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        locationManager.stopUpdatingLocation() // stop updating after accessing location info
    }
}

