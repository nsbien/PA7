//
//  Trips.swift
//  PA6
//
//  Created by Nicole Bien on 11/5/20.
//

import Foundation

class Trip: CustomStringConvertible {
    var destination: String
    var startDate: String
    var endDate: String
    var description: String {
        return destination
    }
    
    init(destination: String, startDate: String, endDate: String) {
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
    }
    
    
}
