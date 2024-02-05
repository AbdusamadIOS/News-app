//
//  WeatherDateModel.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 17/11/23.
//

import UIKit

struct CurrentResponse: Decodable {
    
    var current: Current
   
}

struct Current: Decodable {
    
    var temp_c: Double
    var last_updated: String
    var condition: Condition
    
}

struct Condition: Decodable {
   
    var icon: String
    
}
