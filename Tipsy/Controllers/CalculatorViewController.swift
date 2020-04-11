//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!

    var person: Int = 2
    var bill: Bill?

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)

        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
    }

    @IBAction func stepperChanged(_ sender: UIStepper) {
        person = Int(sender.value)
        splitNumberLabel.text = String(person)
    }

    @IBAction func calculateChanged(_ sender: Any) {
        print(splitNumberLabel.text ?? "0")

        var tipPercent = 0

        if tenPctButton.isSelected {
            tipPercent = 10
        }
        else if twentyPctButton.isSelected {
            tipPercent = 20
        }

        let totalBill = Double(billTextField.text ?? "0") ?? 0.0

        print("\(totalBill) \(tipPercent) \(person)")

        let result = totalBill * ((Double(tipPercent) + 100.0) / 100.0) / Double(person)
        let resultTo2DecimalPlaces = String(format: "%.2f", result)
        print(resultTo2DecimalPlaces)

        bill = Bill(peopleCount: person, tipPercent: tipPercent, billPerPerson: resultTo2DecimalPlaces)
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController

            destinationVC.bill = bill
        }
    }
}
