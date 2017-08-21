//
//  MaterialTextField.swift
//  Contactless
//
//  Created by Vardhan Agrawal on 8/11/17.
//  Copyright © 2017 Vardhan Agrawal. All rights reserved.
//

import UIKit

@IBDesignable
class MaterialTextField: UITextField {

    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var color: UIColor = UIColor.gray {
        didSet {
            layer.backgroundColor = color.cgColor
        }
    }
    
    @IBInspectable var shadowOffsetHeight: CGFloat = 3 {
        didSet {
            layer.cornerRadius = shadowOffsetHeight
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }


    
    // Placeholder placement
    override func textRect(forBounds bounds: CGRect) -> CGRect { return bounds.insetBy(dx: 10, dy: 0) }
    
    // Text placement while editing
    override func editingRect(forBounds bounds: CGRect) -> CGRect { return bounds.insetBy(dx: 10, dy: 0) }
}
