//
//  GameHandler.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 13/05/2022.
//

import Foundation


class GameHandler {
    private let parseJsonPresidents = ParseJsonPresidents()
    private var presidentsNames:[String]? = []
    private var presidents:[President]? = []
    private var presidentIndex = 0
    var disqualifications = 3
    var roundInProgressBar:Float = 0.067
    
    
    init() {
        initPresident()
        
        }
        
    
    
    
    func prepereTheData(isReadyToPlay:  @escaping  (Bool) -> Void) {
        parseJsonPresidents.getPresidentsNames { [weak self] (isGetAllDate , presidentsNames) in
                
                self?.presidentsNames = presidentsNames.presidentsNames
                isReadyToPlay(isGetAllDate)
           
                                
        }
        
    }
    
    private func initPresident() {
        var allPresidents = [
            President("https://user-images.githubusercontent.com/104094292/168457548-4898386c-893e-44d9-b685-607da637c98f.jpeg" , "Barack Obama"),
            President("https://user-images.githubusercontent.com/104094292/168457329-b4128c22-3417-45cb-b7a8-dc3a6f9a7407.jpeg" , "Bill Clinton"),
            President("https://user-images.githubusercontent.com/104094292/168457365-a6af3ef4-cdcf-4f81-aaf3-86f7a16e16c3.jpeg" , "Donald Trump"),
            President("https://user-images.githubusercontent.com/104094292/168457393-132f1f5d-7732-46af-9b91-d319f883f015.jpeg" , "Dwight D. Eisenhower"),
            President("https://user-images.githubusercontent.com/104094292/168457419-792b3428-da65-4551-80b8-bbe0beda9dd2.jpeg" , "Franklin D. Roosevelt"),
            President("https://user-images.githubusercontent.com/104094292/168457430-1c56839a-2bb1-416f-b55a-69bd7f5ddafc.jpeg" , "George H. W. Bush"),
            President("https://user-images.githubusercontent.com/104094292/168457441-3ed513e9-4627-4433-8880-72de8be122dc.jpeg" , "George W Bush"),
            President("https://user-images.githubusercontent.com/104094292/168457450-0a9e7d4a-1f39-484e-917a-a394c4867553.jpeg" , "Gerald Ford"),
            President("https://user-images.githubusercontent.com/104094292/168457462-c1c5c7d2-c94d-40bb-ad65-9e0ead8d115b.jpeg" , "Harry S. Truman"),
            President("https://user-images.githubusercontent.com/104094292/168457477-35bffb89-897c-42d2-8f50-7320aef7fd60.jpeg" , "Jimmy_Carter"),
            President("https://user-images.githubusercontent.com/104094292/168457489-8e65a354-0f8e-48cf-a775-8516e356950a.jpeg" , "Joe Biden"),
            President("https://user-images.githubusercontent.com/104094292/168457500-656feac6-b95a-41a8-aa58-f50b72d29478.jpg" , "John F Kennedy"),
            President("https://user-images.githubusercontent.com/104094292/168457512-e41f0a95-5052-452a-ba13-889e49ddbff5.jpeg" , "Lyndon Johnson"),
            President("https://user-images.githubusercontent.com/104094292/168457523-b66bf95c-59d3-4448-9f20-de309b1b59f9.jpeg" , "Richard M. Nixon"),
            President("https://user-images.githubusercontent.com/104094292/168457537-aedc2ace-dd6b-48f2-acc8-6f71cb18a3d5.jpeg" , "Ronald Reagan")
        ]
        allPresidents.shuffle()
        self.presidents = allPresidents
    }

    
    
    
    private func suffleQuestions() {
        self.presidentsNames?.shuffle()
    }
    
    
    private func sufflePresidents() {
        self.presidents?.shuffle()
    }
    
    
    func getPresidentPicture() -> String? {
        
        return  presidents?[presidentIndex].photoStrUrl
        
        
    }
    
    func getPresidentName() -> String? {
        return presidents?[presidentIndex].name
    }
    
    
    func isGameEnd() -> Bool {
        if(getRound() > 14) {
            return true
        }
        return false
    }
    
    func getQuestions() -> [String] {
        suffleQuestions()
        var currentQuestions:[String] = []
        var threeLoop = 0;
        // when presidentsNames not null
        if let presidentsNames = presidentsNames {
            // get three names not equal the name in the picture
            for presidentsName in presidentsNames where presidentsName != presidents?[presidentIndex].name{
                threeLoop += 1
                currentQuestions.append(presidentsName)
                if(threeLoop == 3) {
                    break
                }
            }
        }
        // inset the current answer
        currentQuestions.append(presidents?[presidentIndex].name ?? "")
        currentQuestions.shuffle()
       return currentQuestions
        
        
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
        
        if let count = presidents?.count {
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


    


