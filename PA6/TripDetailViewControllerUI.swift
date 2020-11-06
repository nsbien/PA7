//
//  TripDetailViewControllerUI.swift
//  PA6
//  Represents the trip details controller
//
//  CPSC 315, Fall 2020
//  No sources to cite
//
//  Created by Nicole Bien on 10/31/20.
//  Copyright (c) 2020 Nicole Bien. All rights reserved.
//

import UIKit

/*
 Shows user the details of the trip they selected
 */
class TripDetailViewControllerUI: UIViewController {
    
    var tripOptional: Trip? = nil
    var tripString: String = ""
    
    @IBOutlet var tripNumber: UILabel!
    @IBOutlet var destinationDetailLabel: UILabel!
    @IBOutlet var startDateDetailLabel: UILabel!
    @IBOutlet var endDateDetailLabel: UILabel!
    @IBOutlet var tripImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        displayTrip()
    }
    
    /*
     Updates the components of the details to the trip
     */
    func displayTrip() {
        if let trip = tripOptional {
            tripNumber.text = tripString
            destinationDetailLabel.text = trip.destination
            startDateDetailLabel.text = trip.startDate
            endDateDetailLabel.text = trip.endDate
//            tripImageView.image = UIImage(named: trip.imageName)
        }
    }
    
}
