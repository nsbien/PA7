//
//  AddTripViewControllerUI.swift
//  PA6
//  Represents the add a trip view controller
//
//  CPSC 315, Fall 2020
//  No sources to cite
//
//  Created by Nicole Bien on 11/5/20.
//  Copyright (c) 2020 Nicole Bien. All rights reserved.
//

import UIKit

/*
 Allows a user to add a trip to their tableview of trips
 */
class AddTripViewControllerUI: UIViewController, UITextFieldDelegate {
    
    var tripOptional: Trip? = nil
    var tripString: String = ""
    
    @IBOutlet var tripNumberAddLabel: UILabel!
    @IBOutlet var destinationAddLabel: UITextField!
    @IBOutlet var startDateAddLabel: UITextField!
    @IBOutlet var endDateAddLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tripNumberAddLabel.text = tripString
    }
    
    /*
     Override function that handles the unwind of the SAVE button
     and alters user if they did enter a destination and dates
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                if let destination = destinationAddLabel.text, let startDate = startDateAddLabel.text, let endDate = endDateAddLabel.text {
                    if (destination == "") {
                        let alert = UIAlertController(title: title, message: "Missing Destination", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                    // check dates
                    let dateFormatterGet = DateFormatter()
                    dateFormatterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
                    // check start date
                    if let _ = dateFormatterGet.date(from: startDate) {
                        print("ok")
                    } else {
                        let alert = UIAlertController(title: title, message: "Missing Destination", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                    // check end date
                    if let _ = dateFormatterGet.date(from: endDate) {
                        print("ok")
                    } else {
                        let alert = UIAlertController(title: title, message: "Missing Destination", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                    tripOptional = Trip(destination: destination, startDate: startDate, endDate: endDate)
                }
            }
        }
    }
    
    /*
     Allows for keyboard to dissapear when user clicks return or off
      the screen
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
