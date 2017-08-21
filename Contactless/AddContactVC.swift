//
//  AddContactVC.swift
//  Contactless
//
//  Created by Vardhan Agrawal on 8/20/17.
//  Copyright © 2017 Vardhan Agrawal. All rights reserved.
//

import UIKit
import Firebase


class AddContactVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var imageView: CircularImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createContactTapped() {
        
        if nameLabel.text != "", phoneLabel.text != "", emailAddress.text != "" {
            
            let newContact = DataService.shared.REF_CONTACTS.childByAutoId()
            newContact.updateChildValues([
                "name" : nameLabel.text!,
                "phone" : phoneLabel.text!,
                "email": emailAddress.text!
            ])
        }
    }
}

