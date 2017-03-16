//
//  bookDetails.swift
//  FileStorage
//
//  Created by Pavani Vellal on 9/25/16.
//  Copyright © 2016 Pavani Vellal. All rights reserved.
//

import UIKit

class bookDetails: NSObject, NSCoding {
    
    var bookName:String = ""
    var bookAuthor:String = ""
    var bookDesc:String = ""
    var enteredDate:String = ""
    
    init(bookName:String,bookAuthor:String,bookDesc:String,enteredDate:String)
    {
        super.init()
        self.bookName = bookName
        self.bookName = bookAuthor
        self.bookDesc = bookDesc
        self.enteredDate = enteredDate
        
        
    }
    
    override var description: String{
        return "Archive: Book Name: \(bookName), Author: \(bookAuthor), Description: \(bookDesc), Timestamp: \(enteredDate)"
    }
    
    required init(coder aDecoder: NSCoder) {
        self.bookName = aDecoder.decodeObject(forKey: "bookName") as! String
        self.bookAuthor = aDecoder.decodeObject(forKey: "bookAuthor") as! String
        self.bookDesc = aDecoder.decodeObject(forKey: "bookDesc") as! String
        self.enteredDate = aDecoder.decodeObject(forKey: "enteredDate") as! String
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(bookName, forKey: "bookName")
        aCoder.encode(bookAuthor, forKey: "bookAuthor")
        aCoder.encode(bookDesc, forKey: "bookDesc")
        aCoder.encode(enteredDate, forKey: "enteredDate")
    }
    
    

    

}
 
