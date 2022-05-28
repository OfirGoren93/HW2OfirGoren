//
//  JsonParse.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 13/05/2022.
//

import Foundation

class ParseJsonPresidents {
    
   private let urlString = "https://api.jsonbin.io/b/62908c14402a5b38021005e1/4"
    var isReadyToPlaycallBack: ((Bool,Questions) -> Void)? = nil
    var questions: Questions = Questions()
    init() {
        
    }
    
    
    func getPresidentsNames( presidentsCallBack: @escaping (_ isReadyToPlay:Bool ,_ presidentsNames: Questions ) -> Void) {
        
        isReadyToPlaycallBack = presidentsCallBack
        
        let url = URL(string: self.urlString)
    
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!, completionHandler: ParseJsonCallBack)
        dataTask.resume()
        
    }
    
    
    private func ParseJsonCallBack(data:Data? , urlResponse:URLResponse? , error:Error?) {
        var isReadyToPlay = false
        if error == nil && data != nil {
            // parse JSON
            let decoder = JSONDecoder()
            
            do {
                questions = try decoder.decode(Questions.self, from: data!)
                isReadyToPlay = true
            }
                catch  {
                    isReadyToPlay = false
                    print("Parseing Failed")
                }
            }
        if let isReadyToPlaycallBack = isReadyToPlaycallBack {
            isReadyToPlaycallBack(isReadyToPlay , questions)
        }
        
        
    }
    
}
