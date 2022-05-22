//
//  UserDefaults.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 15/05/2022.
//

import Foundation

class MyUserDefaults:UserDefaults {
    
    private let key = "key"
    
    
    func saveInt(_ round:Int) {
        super.set(round, forKey: key)
        
        
    }
    
    func getInt() -> Int? {
        return super.integer(forKey: key)
        
        
    }
    
    func deleteAll() {
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
            }
    }
    
}


