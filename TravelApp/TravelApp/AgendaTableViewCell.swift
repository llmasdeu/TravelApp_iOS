//
//  AgendaTableViewCell.swift
//  TravelApp
//
//  Created by Lluís Masdeu on 21/01/2020.
//  Copyright © 2020 Lluís Masdeu. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
