//
//  ActivityDescriptionViewController.swift
//  TravelApp
//
//  Created by Lluís Masdeu on 28/01/2020.
//  Copyright © 2020 Lluís Masdeu. All rights reserved.
//

import UIKit
import EventKit

class ActivityDescriptionViewController: UIViewController {
    var activity: Activity?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = activity?.title
        
        if activity?.description == "" || activity?.description == nil {
            descriptionTextView.text = "No description"
        } else {
            descriptionTextView.text = activity?.description
        }
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/MM/yyyy HH:mm"
        dateLabel.text = dateFormatterGet.string(from: activity!.date)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }*/

    @IBAction func onAddToCalendarButtonPress(_ sender: UIButton) {
        let eventStore = EKEventStore()
        
        switch EKEventStore.authorizationStatus(for: .event) {
            case .authorized:
                insertEvent(store: eventStore)
            case .denied:
                print("Access denied")
            case .notDetermined:
            // 3
                eventStore.requestAccess(to: .event, completion:
                  {[weak self] (granted: Bool, error: Error?) -> Void in
                      if granted {
                        self!.insertEvent(store: eventStore)
                      } else {
                            print("Access denied")
                      }
                })
                default:
                    print("Case default")
        }
    }
    
    func insertEvent(store: EKEventStore) {
        // 1
        let calendars = store.calendars(for: .event)
            
        for calendar in calendars {
            print("\(calendar.title)")
            // 2
            if calendar.title == "Calendar" {
                print("skdfdjsgjfgdgdfggdfgdgdfgdfgfdgd")
                // 3
                let startDate = self.activity?.date
                // 2 hours
                let endDate = startDate!.addingTimeInterval(2 * 60 * 60)
                    
                // 4
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                    
                event.title = activity?.title
                event.startDate = startDate
                event.endDate = endDate
                    
                // 5
                do {
                    try store.save(event, span: .thisEvent)
                    let alert = UIAlertController(title: "Great!", message: "Calendar event added successfully", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default, handler: nil))
                    present(alert, animated: true, completion: nil)
                } catch {
                    let alert = UIAlertController(title: "Ouch!", message: "Error saving event in calendar", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default, handler: nil))
                   print("Error saving event in calendar")
                    
                }
            }
        }
    }
}
