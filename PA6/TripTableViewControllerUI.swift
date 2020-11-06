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
        
    }
}

