//
//  ViewController.swift
//  howManyFingers
//
//  Created by Sheshagiri Haniyur on 5/26/16.
//  Copyright © 2016 Sheshagiri Haniyur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessedNumber: UITextField!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var score: UILabel!
    var selno:String = ""
    var score_no:Int = 0
    
    
    @IBAction func onClick(sender: AnyObject) {
        
        
        var g_num = Int(guessedNumber.text!)
        var random_no = arc4random_uniform(11)
        
        
        if g_num == Int(random_no)
        {
            selno = String(random_no)
            answer.text = "Yeah Correct!\(selno)"
            score_no = score_no + 1
            score.text = String(score_no)
            self.img.image = UIImage(named: selno)
            
         }
        else
        {
            selno = String(random_no)
            answer.text = "Nope Sorry! \(selno)"
            score.text = String(score_no)
            self.img.image = UIImage(named: selno)
            
        }
     
    }
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

