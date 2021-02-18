//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var computedAmmount : Float? = 0.0
    var billTotal : Float? = 0.0
    var tipPerc :Float = 0.0
    var splitNumber :Float = 0.0
    var stringPercentage : String = "10%"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        var selectedPerc :String = sender.currentTitle ?? "10"
        stringPercentage = selectedPerc
        if let i = selectedPerc.firstIndex(of: "%") {
            selectedPerc.remove(at: i)
        }
        
        tipPerc = Float(selectedPerc)!/100.0

    }
    
    @IBAction func billNumberField(_ sender: UITextField) {
        billTotal = Float(sender.text ?? "0.0")
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitNumber = Float(sender.value)
        billTextField.endEditing(true)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        computedAmmount = (billTotal! + billTotal! * tipPerc) / splitNumber
        print(computedAmmount!)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"  {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = String(computedAmmount!)
            destinationVC.splitNumber = String(splitNumberLabel.text!)
            destinationVC.tipPercentage = String(stringPercentage)
            
        }
    }
    
}

