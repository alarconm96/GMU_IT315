//
//  ViewController.swift
//  TipCalculator
//
//  Created by Marco on 2/22/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtAmount: UITextField!
    
    @IBOutlet weak var sldTip: UISlider!
    
    @IBOutlet weak var lblTipPercentage: UILabel!
    
    @IBAction func sldValChange(_ sender: Any) {
        var amount:Double = 0.0
        var tipPercentage = Double(sldTip.value)
        lblTipPercentage.text = String(format: "%.2f", tipPercentage)
        amount = Double(txtAmount.text!)!
        
        var total = (amount * (tipPercentage / 100)) + amount
        lblTotalAmount.text = String(format: "%.2f", total)
        
        if tipPercentage > 50{
            lblTipPercentage.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1)
        }else {
            lblTipPercentage.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
        }
    }
    
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

