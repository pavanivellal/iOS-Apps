//
//  ViewController.swift
//  IsItPrime
//
//  Created by Sheshagiri Haniyur on 9/19/16.
//  Copyright © 2016 Sheshagiri Haniyur. All rights reserved.
//

import UIKit

//let Folder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask,true)[0] as String
//let FileName = "/MyFile.txt"
//let filePath = Folder.stringByAppendingString(FileName)



class ViewController: UIViewController {

    @IBOutlet weak var iDesc         : UITextView!
    
    @IBOutlet weak var ibookName     : UITextField!
    
    @IBOutlet weak var ibookAuthor   : UITextField!
    
    @IBAction func archiveSave(sender: AnyObject) {
    }
    @IBAction func fileSave(sender: AnyObject) {
        
        
        //var bookName = ibookName.text
        //var author = ibookAuthor.text
        //var desc = iDesc.text
       // var data = "Bookname : \(bookName), Author : \(author), Description : \(desc)"
        
        //let fileManager = NSFileManager.defaultManager()
        
        //if(!fileManager.fileExistsAtPath(filePath))
        //{
             
        //}
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NSUserDefaults.standardUserDefaults().setObject("Pavani", forKey: "name")
        //var name = NSUserDefaults.standardUserDefaults().objectForKey("name")! as! String
        //print(name)
        iDesc.layer.borderWidth = 1
        iDesc.layer.borderColor = UIColor.blackColor().CGColor
        ibookName.layer.backgroundColor = UIColor.whiteColor().CGColor
        ibookAuthor.layer.backgroundColor = UIColor.whiteColor().CGColor
        
        
        

        
        
        
        
        
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

