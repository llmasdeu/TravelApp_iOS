//
//  Activity.swift
//  TravelApp
//
//  Created by Lluís Masdeu on 22/01/2020.
//  Copyright © 2020 Lluís Masdeu. All rights reserved.
//

import Foundation

class Activity: Codable {
    var title: String
    var description: String
    var date: Date
    
    init(title: String, description: String, date: Date) {
        self.title = title
        self.description = description
        self.date = date
    }
}
