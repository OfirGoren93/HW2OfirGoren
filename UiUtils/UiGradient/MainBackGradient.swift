//
//  MainBackGradient.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 12/05/2022.
//

import Foundation
import UIKit

class MainBackGradient:UIView {
    
    
    override func layoutSubviews() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orange , UIColor.green]
        gradient.startPoint = CGPoint.init(x: 0 ,y:0 )
        gradient.endPoint = CGPoint.init(x: 1 ,y:1 )
        gradient.frame = self.bounds
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    

    
    
    
}
