//
//  AddTripViewControllerUI.swift
//  PA6
//
//  Created by Nicole Bien on 11/5/20.
//

import UIKit

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
                    // check start date
                    // check end date
                    tripOptional = Trip(destination: destination, startDate: startDate, endDate: endDate)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
