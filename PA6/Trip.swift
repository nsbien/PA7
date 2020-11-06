//
//  Trips.swift
//  PA6
//  Represents a Trip
//
//  CPSC 315, Fall 2020
//  No sources to cite
//
//  Created by Nicole Bien on 11/5/20.
//  Copyright (c) 2020 Nicole Bien. All rights reserved.
//

import Foundation

class Trip: CustomStringConvertible {
    var destination: String
    var startDate: String
    var endDate: String
    var description: String {
        return destination
    }
    
    /*
     EVC of a trip
     @params: destination - name of desination user traveled to,
        startdate - start date of their trip
        end date - end date of their trip
     */
    init(destination: String, startDate: String, endDate: String) {
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
    }
    
    
}
