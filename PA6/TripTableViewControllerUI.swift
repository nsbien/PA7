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
        trips.append(Trip(destination: "Oahu", startDate: "01/01/2020", endDate: "02/01/2020"))
        trips.append(Trip(destination: "Maui", startDate: "02/03/2020", endDate: "02/02/2020"))
        trips.append(Trip(destination: "Washington", startDate: "09/01/2020", endDate: "12/01/2020"))
        trips.append(Trip(destination: "Oregon", startDate: "01/21/2020", endDate: "08/11/2020"))
        trips.append(Trip(destination: "Alaska", startDate: "06/30/2020", endDate: "07/21/2020"))
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
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let trip = trips.remove(at: sourceIndexPath.row)
        trips.insert(trip, at: destinationIndexPath.row)
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            trips.remove(at: indexPath.row)
            tableview.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "DetailSegue" {
                if let tripDetailVC = segue.destination as? TripDetailViewControllerUI {
                    if let indexPath = tableview.indexPathForSelectedRow {
                        let trip = trips[indexPath.row]
                        tripDetailVC.tripOptional = trip
                        tripDetailVC.tripString = "Trip \(indexPath.row + 1) of \(trips.count)"
                    }
                }
            }
            else if identifier == "AddSegue" {
                if let tripAddVC = segue.destination as? AddTripViewControllerUI {
                    tripAddVC.tripString = "Add Trip #\(trips.count + 1)"
                    if let indexPath = tableview.indexPathForSelectedRow {
                        let trip = trips[indexPath.row]
                        tripAddVC.tripOptional = trip
                    }
                }
                if let indexPath = tableview.indexPathForSelectedRow {
                    // delect the row!!
                    tableview.deselectRow(at: indexPath, animated: true)
                }
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
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        let newEditingMode = !tableview.isEditing
        tableview.setEditing(newEditingMode, animated: true)
    }
}

