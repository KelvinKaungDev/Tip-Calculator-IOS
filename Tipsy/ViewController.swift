//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billAmount: UITextField!
    @IBOutlet var splitNumber: UILabel!
    
    @IBOutlet var twentyTip: UIButton!
    @IBOutlet var tenTip: UIButton!
    @IBOutlet var zeroTip: UIButton!
    
    var tip : Double = 0.1
    var peopleNumber = 1.0
    var result : Double = 0.0
    var tipTitle : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroTip.isSelected = false
        tenTip.isSelected = false
        twentyTip.isSelected = false
        sender.isSelected = true
        
        tipTitle = sender.currentTitle!
        let dropPercentageSign = String(tipTitle.dropLast())
        tip = Double(dropPercentageSign)! / 100
    }
        
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumber.text = String(format: "%.0f",sender.value)
        peopleNumber = Double(sender.value)
    }
    
    @IBAction func calculateResult(_ sender: UIButton) {
        let amount = (Double(billAmount.text!)!)
        result = (amount * tip) * peopleNumber
        
        performSegue(withIdentifier: "tipResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tipResult" {
            let destination = segue.destination as! ResultViewController
            destination.result = result
            destination.people = Int(peopleNumber)
            destination.tip = tipTitle
        }
    }
    
    
}

