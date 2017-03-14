//
//  ViewController.swift
//  Tippy
//
//  Created by Schultze, Thomas on 3/12/17.
//  Copyright © 2017 Schultze, Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentOptions = [18, 20, 25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "tipPercentOption1") != nil
        {
            tipPercentOptions[0] = Int(UserDefaults.standard.string(forKey: "tipPercentOption1")!)!
        }
        if UserDefaults.standard.object(forKey: "tipPercentOption2") != nil
        {
            tipPercentOptions[1] = Int(UserDefaults.standard.string(forKey: "tipPercentOption2")!)!
        }
        if UserDefaults.standard.object(forKey: "tipPercentOption3") != nil
        {
            tipPercentOptions[2] = Int(UserDefaults.standard.string(forKey: "tipPercentOption3")!)!
        }
        tipControl.setTitle(String(tipPercentOptions[0]) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(tipPercentOptions[1]) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(tipPercentOptions[2]) + "%", forSegmentAt: 2)
        
        CalculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func CalculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(tipPercentOptions[tipControl.selectedSegmentIndex]) / 100
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

