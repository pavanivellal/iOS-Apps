//
//  ViewController.swift
//  Crypto
//
//  Created by Sheshagiri Haniyur on 11/8/16.
//  Copyright © 2016 Sheshagiri Haniyur. All rights reserved.
//

import UIKit

let Folder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as String
let FileName = "/myFile"
let FilePath = Folder + FileName
let readFile:String = ""

let parameters: [String: AnyObject] = [
    kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
    kSecAttrKeySizeInBits as String: 1024 as AnyObject
]

var publicKey, privateKey: SecKey?

let blockSize = SecKeyGetBlockSize(publicKey!)

var messageEncrypted = [UInt8](repeating: 0, count: blockSize)
var messageEncryptedSize = blockSize

var status: OSStatus!

var Data:String = ""

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var display: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        name.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        id.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        
        //let descChange  = UITextView.didChange(NSObject)
    }
    
    func myEncrypt() -> [UInt8]
    {
        Data = "Crypto: name: \(name.text!) , id: \(id.text!),  Description: \(desc.text!)\n"
        var plainText:String = Data
        SecKeyGeneratePair(parameters as CFDictionary, &publicKey, &privateKey)
        status = SecKeyEncrypt(publicKey!, SecPadding.PKCS1, plainText, plainText.characters.count, &messageEncrypted, &messageEncryptedSize)
        
        if status != noErr {
            print("Encryption Error!")
            
        }
        
        return messageEncrypted
    }
    
    func myDecrypt() -> NSString
    {
        
        //Decrypt the entrypted string with the private key
        var messageDecrypted = [UInt8](repeating: 0, count: blockSize)
        var messageDecryptedSize = messageEncryptedSize
        
        status = SecKeyDecrypt(privateKey!, SecPadding.PKCS1, &messageEncrypted, messageEncryptedSize, &messageDecrypted, &messageDecryptedSize)
        
        if status != noErr {
            print("Decryption Error!")
        }
        
        //print(NSString(bytes: &messageDecrypted, length: messageDecryptedSize, encoding: NSUTF8StringEncoding)!)
        
        return NSString(bytes: &messageDecrypted, length: messageDecryptedSize, encoding: String.Encoding.utf8.rawValue)!
        
    }
    
    @IBAction func onEncrypt(_ sender: AnyObject) {
//        print("Encrypt")
    }
    
    @IBAction func onDecrypt(_ sender: AnyObject) {
//        print("Decrypt")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "encryptSegue"
        {
            print("Encrypt")
            let encryptCode = myEncrypt()
            print(encryptCode)
            
            if let encryptVC = segue.destination as? EncryptViewController {
                encryptVC.result = encryptCode
            }
            
        }
        else if segue.identifier == "decryptSegue"
        {
            print("Decrypt")
            let decryptCode = myDecrypt()
            print(decryptCode)
            if let decryptVC = segue.destination as? DecryptViewController {
                decryptVC.result = decryptCode
            }
        }
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        Data = "Crypto: name: \(name.text!) , id: \(id.text!),  Description: \(desc.text!)\n"
        display.text = Data
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text);
    }
    
    @IBAction func onChange(_ sender: AnyObject) {
    }
    
    
    @IBAction func onIDChange(_ sender: AnyObject) {
    }
    
    
    
    
    
}

