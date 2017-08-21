//
//  MaterialButton.swift
//  Contactless
//
//  Created by Vardhan Agrawal on 8/11/17.
//  Copyright © 2017 Vardhan Agrawal. All rights reserved.
//

import UIKit

@IBDesignable
class MaterialButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled == true {
                self.titleLabel?.textColor = UIColor.lightGray
            } else {
                self.titleLabel?.textColor = UIColor.white
            }
        }
    }
}
