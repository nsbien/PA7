//
//  TripTableViewCell.swift
//  PA6
//  Represents a TableView Cell in the table
//
//  CPSC 315, Fall 2020
//  No sources to cite
//
//  Created by Nicole Bien on 11/5/20.
//  Copyright (c) 2020 Nicole Bien. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*
     Updates the labels on the screen
     */
    func update(with trip: Trip) {
        destinationLabel.text = trip.destination
        startDateLabel.text = trip.startDate
        endDateLabel.text = trip.endDate
    }

}
