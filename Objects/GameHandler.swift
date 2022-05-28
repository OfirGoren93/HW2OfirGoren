//
//  GameHandler.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 13/05/2022.
//

import Foundation


class GameHandler {
    private let parseJsonPresidents = ParseJsonPresidents()
    private var allQuestions:Questions?
    private var presidents:[President]? = []
    private var presidentIndex = 0
    var disqualifications = 3
    var roundInProgressBar:Float = 0.067
    
    
   
    
    func prepereTheData(isReadyToPlay:  @escaping  (Bool) -> Void) {
        parseJsonPresidents.getPresidentsNames { [weak self] (isGetAllDate , Questions) in
                
                self?.allQuestions = Questions
                self?.suffleQuestions()
                isReadyToPlay(isGetAllDate)
           
                                
        }
        
    }
    

    
    private func suffleQuestions() {
        self.allQuestions?.questions?.shuffle()
    }
    
    
    private func sufflePresidents() {
        self.allQuestions?.questions?[presidentIndex].answers?.shuffle()
    }
    
    
    func getPresidentPicture() -> String? {
        
        return  allQuestions?.questions?[presidentIndex].url
        
        
    }
    
    func getAnswers() -> [String]? {
        
        return allQuestions?.questions?[presidentIndex].answers
        
    }
    
    func getPresidentName() -> String? {
        return allQuestions?.questions?[presidentIndex].currectAnswer
    }
    
    
    func isGameEnd() -> Bool {
        if(getRound() > 14) {
            return true
        }
        return false
    }
    

    
    func isCurrentAnswer(answer:String?)->Bool {
            
         if let answer = answer {
             updateDisqualifications(true)
             if answer == getPresidentName() {
                 return true
             }
             
        }
        updateDisqualifications(false)
        return false
    }
    
    
    
 private func updateDisqualifications(_ isCurrentAnswer:Bool)  {
        if(!isCurrentAnswer) {
            self.disqualifications -= 1
        }
    }
    
    func getRound() -> Int {
        
        return presidentIndex + 1
        
    }
    
    func moveNextQuestion() {
        
        if let count = allQuestions?.questions?.count {
            if(presidentIndex < count - 1) {
            updateProgressBarRound()
            presidentIndex += 1
            }
        }
    
}
    
   func updateProgressBarRound(){
        self.roundInProgressBar += 0.067
    }
    
    
    
    func UpdateRecord() {
        
        let myUserDefaults = MyUserDefaults()
        let score = myUserDefaults.getInt()
        if let score = score {
            if(score < self.getRound()) {
                myUserDefaults.saveInt(self.getRound())
            }
        }else {
            myUserDefaults.saveInt(self.getRound())
        }
}
    
}


    


