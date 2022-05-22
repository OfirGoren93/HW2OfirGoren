//
//  Extensions.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 12/05/2022.
//

import Foundation
import UIKit


extension UIImageView {
    
    
    func setRounded() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
      }
    
}


