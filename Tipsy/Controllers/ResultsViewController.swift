//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Noah Edgeworth on 11/19/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var roundedTotalPerPerson = 0.0
    var tip = ""
    var peopleSplit = 2
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(roundedTotalPerPerson)
        settingsLabel.text = "Split between \(peopleSplit) people, with \(tip) tip."
        // Do any additional setup after loading the view.
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
