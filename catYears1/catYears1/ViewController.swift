//
//  ViewController.swift
//  catYears1
//
//  Created by Sheshagiri Haniyur on 5/23/16.
//  Copyright © 2016 Sheshagiri Haniyur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var catAge: UITextField!
    
    @IBOutlet weak var catYears: UILabel!
    
    @IBAction func findAge(_ sender: AnyObject) {
        
        if (catAge.text != "" && catAge.text != nil  )
        {
            let enteredAge: Int? = Int(catAge.text!)
       
            let res = (enteredAge! * 7)
        
            catYears.text = "Your cat is \(res) cat years old"
            
        }
        else
        {
            catYears.text = "Age not entered"
        }
        
        
    }
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

