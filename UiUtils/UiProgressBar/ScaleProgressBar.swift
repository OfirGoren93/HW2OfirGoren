//
//  ScaleProgressBar.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 12/05/2022.
//


import UIKit

class ScaleProgressBar:UIProgressView {
    
  
   
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        transform =  transform.scaledBy(x: 1, y: 3)
    }
   
}
