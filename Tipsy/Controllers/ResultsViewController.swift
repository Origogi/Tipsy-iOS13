//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 1101373 on 2020/04/11.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!

    var bill: Bill?

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = bill?.billPerPerson
        settingsLabel.text = "Split between \(bill?.billPerPerson ?? "0.0") people, with \(bill?.tipPercent ?? 0)% tip."
    }

    @IBAction func recalulatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
