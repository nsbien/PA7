//
//  TripTableViewControllerUI.swift
//  PA6
//
//  Created by Nicole Bien on 10/31/20.
//

import UIKit

class TripTableViewControllerUI: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var trips = [Trip]()
    
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTrips()
    }
    
    func initializeTrips() {
        trips.append(Trip(destination: "Hawaii", startDate: "01/01/2020", endDate: "02/01/2020"))
        trips.append(Trip(destination: "Maui", startDate: "01/01/2020", endDate: "02/01/2020"))
        trips.append(Trip(destination: "Washington", startDate: "01/01/2020", endDate: "02/01/2020"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return trips.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let trip = trips[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripTableViewCell
        
        cell.update(with: trip)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "DetailSegue" {
                if let tripDetailVC = segue.destination as? TripDetailViewControllerUI {
                    if let indexPath = tableview.indexPathForSelectedRow {
                        let trip = trips[indexPath.row]
                        tripDetailVC.tripOptional = trip
                    }
                }
            }
            else if identifier == "AddSegue" {
                print("cats")
//                if let tripAddVC = segue.destination as? AddTripViewControllerUI {
//                    if let indexPath = tableview.indexPathForSelectedRow {
//                        let trip = trips[indexPath.row]
//                        tripAddVC.tripOptional = trip
//                    }
//                }
//                if let indexPath = tableview.indexPathForSelectedRow {
//                    // delect the row!!
//                    tableview.deselectRow(at: indexPath, animated: true)
//                }
            }
        }
    }
    
    @IBAction func unwindToTripTableViewController(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                if let tripAddVC = segue.source as? AddTripViewControllerUI {
                    if let trip = tripAddVC.tripOptional {
                        if let indexPath = tableview.indexPathForSelectedRow {
                            trips[indexPath.row] = trip
                        }
                        else {
                            trips.append(trip)
                        }
                        tableview.reloadData()
                    }
                }
            }
        }
    }
    
    @IBAction func unwindCancel(segue: UIStoryboardSegue) {}
}

