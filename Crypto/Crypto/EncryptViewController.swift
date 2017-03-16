//
//  EncryptViewController.swift
//  Crypto
//
//  Created by Sheshagiri Haniyur on 11/10/16.
//  Copyright © 2016 Sheshagiri Haniyur. All rights reserved.
//

import UIKit

class EncryptViewController: UIViewController {
    
    
    @IBOutlet weak var resultText: UITextView!
    
    var result:[UInt8] = [0]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Encrypt";
        resultText.text = String(describing: result)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
