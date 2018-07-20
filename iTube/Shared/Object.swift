//
//  SharedObject.swift
//  FreeHands
//
//  Created by Apple on 7/1/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit
import CoreLocation

class Object {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static var locationManager: CLLocationManager?
    static var userLocation : CLLocation?
    
    static let layout = UICollectionViewFlowLayout()
    
    
}
