//
//  ShapeButton.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 12/05/2022.
//

import Foundation
import UIKit

class ShapeButton:UIButton {
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 10
        
    }
    
    
}
