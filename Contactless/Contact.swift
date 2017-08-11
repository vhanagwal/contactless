//
//  Contact.swift
//  Contactless
//
//  Created by Vardhan Agrawal on 8/11/17.
//  Copyright © 2017 Vardhan Agrawal. All rights reserved.
//

import UIKit

struct Contact {
    
    private var _userID: String
    
    private var _name: String
    private var _email: String
    private var _phone: String
    private var _location: String
    
    var userID: String { return _userID }
    
    var name: String { return _name }
    var email: String { return _email }
    var phone: String { return _phone }
    var location: String { return _location }
    
    init() {
        self._userID = ""
        
        self._name = ""
        self._email = ""
        self._phone = ""
        self._location = ""
    }
    
    init(userID: String, data dictionary: Dictionary <String, AnyObject>) {
        self._userID = userID
        
        if let name = dictionary["name"] as? String { self._name = name } else { self._name = "" }
        if let email = dictionary["email"] as? String { self._email = email } else { self._email = "" }
        if let phone = dictionary["phone"] as? String { self._phone = phone } else { self._phone = "" }
        if let location = dictionary["location"] as? String { self._location = location } else { self._location = "" }
        
    }
    
}
