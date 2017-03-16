//
//  DecryptViewController.swift
//  Crypto
//
//  Created by Sheshagiri Haniyur on 11/10/16.
//  Copyright © 2016 Sheshagiri Haniyur. All rights reserved.
//

import UIKit

class DecryptViewController: UIViewController {
    
    @IBOutlet weak var resultText: UITextView!
    var result:NSString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Decrypt";
        resultText.text = String(result)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
