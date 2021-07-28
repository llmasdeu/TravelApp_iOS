//
//  AgendaTableViewController.swift
//  TravelApp
//
//  Created by Lluís Masdeu on 28/01/2020.
//  Copyright © 2020 Lluís Masdeu. All rights reserved.
//

import UIKit

class AgendaTableViewController: UITableViewController {
    var activities: [Activity] = [Activity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! AgendaTableViewCell
        let dateFormattedGet = DateFormatter()
        dateFormattedGet.dateFormat = "dd/MM"
        cell.dateLabel.text = dateFormattedGet.string(from: activities[indexPath.row].date)
        cell.titleLabel.text = activities[indexPath.row].title

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // A segue is the transition between two controllers. In this case, is the one between the one with the table, and the one with the menu for adding a task
        if segue.identifier == "addActivity" {
            let vc = segue.destination as! AddActivityViewController
            vc.newActivityCreated = { newActivity in
                self.activities.append(newActivity)
                self.saveToLocal()
                self.setupData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ActivityDescriptionViewController(nibName: "ActivityDescriptionViewController", bundle: nil)
        vc.activity = self.activities[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            if (self.activities.count > 0) {
                self.activities.remove(at: indexPath.row)
            } else if (self.activities.count == 1) {
                self.activities.removeAll()
            }
            
            self.saveToLocal()
            self.tableView.reloadData()
        }
    }
    
    func setupData() {
        getElementsFromLocal()
        self.tableView.reloadData()
    }
    
    func saveToLocal() {
        var activitiesAux = self.activities
        activitiesAux = activitiesAux.sorted(by: {
            $0.date < $1.date
        })
        
        self.activities = activitiesAux
        let userDefaults = UserDefaults.standard
        let activitiesData = try! JSONEncoder().encode(activities)
        userDefaults.set(activitiesData, forKey: "activities")
        userDefaults.synchronize()
    }
    
    func getElementsFromLocal() {
        let userDefaults = UserDefaults.standard
        if let activitiesData = userDefaults.data(forKey: "activities") {
            let activitiesAux = try! JSONDecoder().decode([Activity].self, from: activitiesData)
            self.activities = activitiesAux
        }
    }
}
