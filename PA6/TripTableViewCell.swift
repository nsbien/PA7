//
//  TripTableViewCell.swift
//  PA6
//
//  Created by Nicole Bien on 11/5/20.
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
    
    func update(with trip: Trip) {
        destinationLabel.text = trip.destination
        startDateLabel.text = trip.startDate
        endDateLabel.text = trip.endDate
    }

}
