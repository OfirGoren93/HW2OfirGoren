//
//  StartController.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 12/05/2022.
//

import UIKit

class StartController: UIViewController {

    private let idnetifiarStartGame = "StartGame"
    private let myUserDefaults = MyUserDefaults()
    @IBOutlet weak var labelScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handlerSetRecordOnLebal()
        
        
    }
    
    private func handlerSetRecordOnLebal() {
        let record = getScoreRecord()
         setRecord(record)
    }
    
    private func setRecord(_ record:Int?) {
        if let record = record {
            labelScore.text = "\(record)/15"
        }
        
    }
    
    private func getScoreRecord() ->Int? {
       return self.myUserDefaults.getInt()
        
        
    }
    

    @IBAction func StartPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: self.idnetifiarStartGame, sender: self)
    }
    
    
  
    
    
}
