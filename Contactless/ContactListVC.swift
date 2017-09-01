/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology. Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import Firebase

class ContactListVC: UITableViewController {
  
  // TableView from Interface Builder
  @IBOutlet var tableview: UITableView!
  
  // Contacts array declaration
  var contacts: [Contact] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()

    observeDatabase()
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
  
  // Observes the database for changes
  func observeDatabase() {
    
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
}

extension ContactListVC {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return contacts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // Creates reusable cell
    let cell = tableview.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
    let contact = contacts[indexPath.row]
    
    // Displays data to cell
    cell.nameLabel.text = contact.name
    cell.emailLabel.text = contact.email
    cell.phoneLabel.text = contact.phone
    
    return cell
  }
}

