//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mateo Luchina on 17/02/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var totalValue :String = ""
    var splitNumber :String = ""
    var tipPercentage :String = ""
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        totalLabel.text = totalValue
        settingsLabel.text = "Split between \(splitNumber) people, with \(tipPercentage) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
