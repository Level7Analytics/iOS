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
    var defaultTipOptionIndex: Int = 0
    
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
            defaultTipOptionIndex = Int(UserDefaults.standard.string(forKey: "defaultTipOptionIndex")!)!
        }
        else
        {
            tipPercentOption1.text = "18"
            tipPercentOption2.text = "20"
            tipPercentOption3.text = "25"
        }
        selectDefaultTipOptionButton(index: defaultTipOptionIndex)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(tipPercentOption1.text, forKey: "tipPercentOption1")
        UserDefaults.standard.set(tipPercentOption2.text, forKey: "tipPercentOption2")
        UserDefaults.standard.set(tipPercentOption3.text, forKey: "tipPercentOption3")
        UserDefaults.standard.set(String(defaultTipOptionIndex), forKey: "defaultTipOptionIndex")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onTipPercentOption1Changed(_ sender: UITextField) {
        defaultTipOptionIndex = 0
        UserDefaults.standard.set(String(defaultTipOptionIndex), forKey: "defaultTipOptionIndex")
        UserDefaults.standard.set(tipPercentOption1.text, forKey: "tipPercentOption1")
    }
    
    @IBAction func onTipPercentOption2Changed(_ sender: UITextField) {
                defaultTipOptionIndex = 1
        UserDefaults.standard.set(String(defaultTipOptionIndex), forKey: "defaultTipOptionIndex")
        UserDefaults.standard.set(tipPercentOption2.text, forKey: "tipPercentOption2")
    }
    
    @IBAction func onTipPercentOption3Changed(_ sender: UITextField) {
        defaultTipOptionIndex = 2
        UserDefaults.standard.set(String(defaultTipOptionIndex), forKey: "defaultTipOptionIndex")
        UserDefaults.standard.set(tipPercentOption3.text, forKey: "tipPercentOption3")
    }
    
    @IBAction func onTipPercentOptionTouchDown(_ sender: UITextField) {
        if sender.tag == 0 {
            defaultTipOptionIndex = 0
            selectTipPercentOption1()
        } else if sender.tag == 1 {
            defaultTipOptionIndex = 1
            selectTipPercentOption2()
        } else if sender.tag == 2 {
            defaultTipOptionIndex = 2
            selectTipPercentOption3()
        }
    }
    
    func selectDefaultTipOptionButton(index: Int) {
        if index == 0 {
            selectTipPercentOption1()
        }
        else if index == 1 {
            selectTipPercentOption2()
        }
        else if index == 2 {
            selectTipPercentOption3()
        }
    }
    
    func selectTipPercentOption1() {
        tipPercentOption1.textColor = UIColor.white
        tipPercentOption2.textColor = UIColor.black
        tipPercentOption3.textColor = UIColor.black
        tipPercentOption1.backgroundColor = UIColor.darkGray
        tipPercentOption2.backgroundColor = UIColor.white
        tipPercentOption3.backgroundColor = UIColor.white
    }
    
    func selectTipPercentOption2() {
        tipPercentOption1.textColor = UIColor.black
        tipPercentOption2.textColor = UIColor.white
        tipPercentOption3.textColor = UIColor.black
        tipPercentOption1.backgroundColor = UIColor.white
        tipPercentOption2.backgroundColor = UIColor.darkGray
        tipPercentOption3.backgroundColor = UIColor.white
    }
    
    func selectTipPercentOption3() {
        tipPercentOption1.textColor = UIColor.black
        tipPercentOption2.textColor = UIColor.black
        tipPercentOption3.textColor = UIColor.white
        tipPercentOption1.backgroundColor = UIColor.white
        tipPercentOption2.backgroundColor = UIColor.white
        tipPercentOption3.backgroundColor = UIColor.darkGray
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
