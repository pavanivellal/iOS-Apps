//
//  ViewController.swift
//  FileStorage
//
//  Created by Pavani Vellal on 9/23/16.
//  Copyright © 2016 Pavani Vellal. All rights reserved.
//

import UIKit
import CloudKit

let Folder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as String
let FileName = "/myFile"
let ArchiveName = "/archive.plist"
let FilePath = Folder + FileName
let ArchivePath = Folder + ArchiveName
let readFile:String = ""



class ViewController: UIViewController {
    
    @IBOutlet weak var iBookName: UITextField!
    
    @IBOutlet weak var iAuthor: UITextField!

    @IBOutlet weak var iDesc: UITextView!

    @IBOutlet weak var Result: UITextView!
    
    @IBAction func saveFile(_ sender: AnyObject) {
        let Data = "File Storage: Bookname: \(iBookName.text!) , Author: \(iAuthor.text!),  Description: \(iDesc.text!), Timestamp : \(getCurrDate())\n"
        let fileManager = FileManager.default
        
        if(!fileManager.fileExists(atPath: FilePath))
        {
            do {
                try Data.write(toFile: FilePath, atomically: true, encoding: String.Encoding.utf8)
                
            }
            catch let error as NSError{print("Error: \(error.domain) . Could not write to the file")}
            
        }
        else
        {
            
            appendData(Data)
        }
        
            Result.text = readFile()

        
    }
    
    //Saving to Archive
    @IBAction func saveArchive(_ sender: AnyObject) {
        
        let bookDts = createBookObj()
        
        var success = false

        success = NSKeyedArchiver.archiveRootObject(bookDts, toFile: ArchivePath)

        
        if(success)
        {
            appendData(bookDts.description)
            Result.text = readFile()
            print("Saved to path \(ArchivePath)")
        }
        else{
            Result.text = "Failed to save to file : \(FilePath)"
            print("Failed to save to file path \(ArchivePath)")
        }
    
    }
    
    @IBAction func Cancel(_ sender: AnyObject) {
        
        exit(0);
    }
    
    @IBAction func UnArchive(_ sender: AnyObject) {
        
        let bookDts1 = NSKeyedUnarchiver.unarchiveObject(withFile: ArchivePath)
        Result.text = "UnArchived: \((bookDts1! as AnyObject).description)"
        print("Successfully Unarchived")
    }
    
    
    
    @IBAction func clearFile1(_ sender: AnyObject) {
        
        let del_text = ""
        
        do {
            try del_text.write(toFile: FilePath, atomically: true, encoding: String.Encoding.utf8)
            
        }
        catch let error as NSError{print("Error: \(error.domain) . Could not write to the file")}
        
        Result.text = "The file has been cleared"
        
    }
    
    
    @IBAction func iCloudSave(_ sender: AnyObject) {
        
        let Data = "Cloud Storage: Bookname: \(iBookName.text!) , Author: \(iAuthor.text!),  Description: \(iDesc.text!), Timestamp : \(getCurrDate())\n"
        let myCloudData = CKRecord(recordType: "myiCloud")
        myCloudData["content"] = Data as CKRecordValue?
        let publicData = CKContainer.default().publicCloudDatabase
        publicData.save(myCloudData, completionHandler: { (record:CKRecord?, error:NSError?) in
            if error == nil{
            print("Successfully Uploaded to cloud")
            }
            else
            {
                print(error?.localizedDescription)
            }
        } as! (CKRecord?, Error?) -> Void) 

        
        
        
        
    }
    
    

    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        iDesc.layer.borderWidth = 1
        iDesc.layer.borderColor = UIColor.black.cgColor
        iBookName.layer.backgroundColor = UIColor.white.cgColor
        iAuthor.layer.backgroundColor = UIColor.white.cgColor
        Result.text = readFile()
     
    }

    
    func readFile() -> String
    {
        var text2:String = ""
        do {
            text2 = try NSString(contentsOfFile: FilePath, encoding: String.Encoding.utf8.rawValue) as String
            print(text2)
        }
        
        catch let error as NSError{
            //text2 = "Error: \(error.domain) . Could not read from file"
            text2 = "File does not exist/File Empty"
            print(text2)
        }
        return text2
    }
    
    func appendData(_ data:String){
        let data = data
        
        let uText = data.data(using: String.Encoding.utf8)
        let fileHandle = FileHandle(forUpdatingAtPath: FilePath)
        fileHandle?.seekToEndOfFile()
        fileHandle?.write(uText!)
        fileHandle?.closeFile()
        print("New Records Appended to file : \(FilePath)")

    }
    
    func getCurrDate() ->String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy, HH:mm a"
        return dateFormatter.string(from: date)
    }
    
    func createBookObj() -> bookDetails
    {
        let bookDts = bookDetails(bookName: iBookName.text!, bookAuthor: iAuthor.text!, bookDesc: iDesc.text, enteredDate: getCurrDate())
        print(bookDts)
        return bookDts
    }


}

