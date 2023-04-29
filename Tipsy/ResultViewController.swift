//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Kaung Htet OO on 4/29/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var people = 0
    var tip : String = ""
    var result : Double = 0.0
    
    @IBOutlet var tipReview: UILabel!
    @IBOutlet var tipResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipResult.text = String(format: "%.2f", result)
        tipReview.text = "Split between \(people) with \(tip) tip."
    }

    @IBAction func recalculateTip(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
