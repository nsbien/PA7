//
//  TripDetailViewControllerUI.swift
//  PA6
//
//  Created by Nicole Bien on 10/31/20.
//

import UIKit

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
