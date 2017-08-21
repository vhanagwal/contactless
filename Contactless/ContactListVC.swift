//
//  ViewController.swift
//  Contactless
//
//  Created by Vardhan Agrawal on 8/11/17.
//  Copyright © 2017 Vardhan Agrawal. All rights reserved.
//

import UIKit
import Firebase

class ContactListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableview: UITableView!
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        DataService.shared.REF_CONTACTS.observe(.value, with: { (snapshots) in

            if let snapshots = snapshots.children.allObjects as? [DataSnapshot] {
              
                self.contacts = []

                for snapshot in snapshots {
                    
                    if let dictionary = snapshot.value as? Dictionary <String, AnyObject> {

                        let key = snapshot.key
                        let contact = Contact(userID: key, data: dictionary)
                        self.contacts.append(contact)
                    }
                }
            }
            
            self.tableview.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableview.indexPathForSelectedRow {
            self.tableview.deselectRow(at: index, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        let contact = contacts[indexPath.row]
        
        cell.nameLabel.text = contact.name
        cell.emailLabel.text = contact.email
        cell.phoneLabel.text = contact.phone
        
        return cell
    }
    
    
}

