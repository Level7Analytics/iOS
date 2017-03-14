//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Schultze, Thomas on 3/12/17.
//  Copyright © 2017 Schultze, Thomas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipPercentOption1: UITextField!
    @IBOutlet weak var tipPercentOption2: UITextField!
    @IBOutlet weak var tipPercentOption3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "tipPercentOption1") != nil
        {
            tipPercentOption1.text = UserDefaults.standard.string(forKey: "tipPercentOption1")
            tipPercentOption2.text = UserDefaults.standard.string(forKey: "tipPercentOption2")
            tipPercentOption3.text = UserDefaults.standard.string(forKey: "tipPercentOption3")
        }
        else
        {
            tipPercentOption1.text = "18"
            tipPercentOption2.text = "20"
            tipPercentOption3.text = "25"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(tipPercentOption1.text, forKey: "tipPercentOption1")
        UserDefaults.standard.set(tipPercentOption2.text, forKey: "tipPercentOption2")
        UserDefaults.standard.set(tipPercentOption3.text, forKey: "tipPercentOption3")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onTipPercentOption1EditingEnd(_ sender: Any) {
        UserDefaults.standard.set(tipPercentOption1.text, forKey: "tipPercentOption1")
    }

    @IBAction func onTipPercentOption2Changed(_ sender: Any) {
        UserDefaults.standard.set(tipPercentOption2.text, forKey: "tipPercentOption2")
    }
    
    @IBAction func onTipPercentOption3Changed(_ sender: Any) {
        UserDefaults.standard.set(tipPercentOption3.text, forKey: "tipPercentOption3")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
