//
//  Location.swift
//  TaxiMeter
//
//  Created by Daisy Rong on 10/26/24.
//

import Foundation
import CoreLocation

class LocationDataManager : NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    var previousLocation: CLLocation!
    var newLocation: CLLocation!
    @Published var distanceTraveled: Double = 0
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.distanceFilter = kCLDistanceFilterNone
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            authorizationStatus = .authorizedWhenInUse
            locationManager.requestLocation()
            break
        
        case .restricted, .denied:
            authorizationStatus = .restricted
            manager.requestWhenInUseAuthorization()
            break
            
        case .notDetermined:
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
            
        default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        newLocation = locations.last
        if (previousLocation == nil) {
            previousLocation = newLocation
        }
        else {
            distanceTraveled += previousLocation.distance(from: newLocation)
            print(distanceTraveled)
        }
        print("Updated!")
        previousLocation = newLocation
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
}
