//
//  CircularImageView.swift
//  Contactless
//
//  Created by Vardhan Agrawal on 8/16/17.
//  Copyright © 2017 Vardhan Agrawal. All rights reserved.
//

import UIKit

@IBDesignable
class CircularImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.height / 2
        
    }
}
