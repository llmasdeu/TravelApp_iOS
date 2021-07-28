//
//  AddActivityViewController.swift
//  TravelApp
//
//  Created by Lluís Masdeu on 28/01/2020.
//  Copyright © 2020 Lluís Masdeu. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    var newActivityCreated: (_ newActivity: Activity) -> Void = { arg in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.borderColor = borderColor.cgColor
        descriptionTextView.layer.cornerRadius = 5.0
        descriptionTextView.flashScrollIndicators()
    }
    
    @IBAction func onAddActivityButtonPress(_ sender: UIButton) {
        // Checking if the task created is empty
        if titleTextField.text?.count == 0 {
            let alert = UIAlertController(title: "Ouch...!", message: "You must create an activity to add it", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Passing the created task to the TableView controller
        let activity: Activity = Activity(title: titleTextField.text!, description: descriptionTextView.text!, date: datePicker.date)
        newActivityCreated(activity)
        self.dismiss(animated: true, completion: nil)
    }
    
}
