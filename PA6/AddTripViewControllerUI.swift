//
//  AddTripViewControllerUI.swift
//  PA6
//
//  Created by Nicole Bien on 11/5/20.
//

import UIKit

class AddTripViewControllerUI: UIViewController {
    
    var tripOptional: Trip? = nil
    
    @IBOutlet var destinationAddLabel: UITextField!
    @IBOutlet var startDateAddLabel: UITextField!
    @IBOutlet var endDateAddLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                if let destination = destinationAddLabel.text, let startDate = startDateAddLabel.text, let endDate = endDateAddLabel.text {
                    if let trip = tripOptional {
                        trip.destination = destination
                        trip.startDate = startDate
                        trip.endDate = endDate
                    }
                    else {
                        tripOptional = Trip(destination: destination, startDate: startDate, endDate: endDate)
                    }
                }
            }
        }
    }

}
