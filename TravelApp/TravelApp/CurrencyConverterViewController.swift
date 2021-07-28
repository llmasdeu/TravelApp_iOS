//
//  CurrencyConverterViewController.swift
//  TravelApp
//
//  Created by Lluís Masdeu on 27/01/2020.
//  Copyright © 2020 Lluís Masdeu. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var toPickerView: UIPickerView!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromTextField: UITextField!

    var pickerData: [String] = [String]()
    var responseData: CurrencyConverterResponseData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.toPickerView.delegate = self
        self.toPickerView.dataSource = self
        
        pickerData = ["CAD", "HKD", "ISK", "PHP", "DKK", "HUF", "CZK", "AUD", "RON", "SEK", "IDR", "INR", "BRL", "RUB", "HRK", "JPY", "THB", "CHF", "SGD", "PLN", "BGN", "TRY", "CNY", "NOK", "NZD", "ZAR", "USD", "MXN", "ILS", "GBP", "KRW", "MYR"]
        
        toLabel.text = ""
        fromTextField.setBottomBorder()
        fromTextField.keyboardType = .decimalPad
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.toLabel.text = "0 \(pickerData[row])"
        
        return pickerData[row]
    }
    
    @IBAction func onConvertButtonPress(_ sender: UIButton) {
        let to: String = pickerData[toPickerView!.selectedRow(inComponent: 0)]
        let amount: Double = (fromTextField.text! as NSString).doubleValue
        
        CurrencyConverterAPIManager.shared.requestCurrencyConverted(from: "EUR", to: to) { (response) in
            print("Stop loading")
            self.responseData = response
            print(response)
            let currency: Double = (self.responseData?.rates?.getCurrencyExchange(currency: to))!
            print(currency)
            let exchanged = amount * currency
            print(exchanged)
            
            self.toLabel.text = "\(exchanged) \(to)"
        }
    }
}
