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
    
    var tip = 0.10
    var peopleSplit = 2
    var total = 0.0
    var billAmount = 0.0
    var totalPerPerson = 0.0
    var roundedTotalPerPerson = 0.0
    var buttonTitle: String = "10%"
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsNumber / 100
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        peopleSplit = Int(sender.value)
        splitNumberLabel.text = String(peopleSplit)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        billAmount = Double(billTextField.text!)!
        total = billAmount + (billAmount * tip)
        totalPerPerson = total / Double(peopleSplit)
        
        roundedTotalPerPerson = round(totalPerPerson * 100) / 100.0
        print(roundedTotalPerPerson)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.roundedTotalPerPerson = roundedTotalPerPerson
            destinationVC.peopleSplit = peopleSplit
            destinationVC.tip = buttonTitle
        }
    }

}

