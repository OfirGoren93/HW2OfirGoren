//
//  StartController.swift
//  HW2OfirGoren
//
//  Created by Ofir Goren on 12/05/2022.
//

import UIKit
import Kingfisher
class GameController: UIViewController {

    @IBOutlet weak var famousImage: UIImageView!
    
    
    @IBOutlet weak var topLeftBtn: ShapeButton!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var disqualifications: UILabel!
    @IBOutlet weak var rightButtomBtn: UIButton!
    @IBOutlet weak var leftButtomBtn: UIButton!
    @IBOutlet weak var topRightBtn: UIButton!
    
    
    @IBOutlet weak var progressBarRound: ScaleProgressBar!
    private let gameHandler = GameHandler()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        famousImage.setRounded()
        startGame()
       
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentingViewController?.viewWillDisappear(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.viewWillAppear(true)
    }
    
    
    
    private func startGame(){
        gameHandler.prepereTheData { [weak self] isReadyToPlay in
            if isReadyToPlay {
                DispatchQueue.main.async {
                    self?.play()
                }
                
            }
        }
        
    }
    
    
    private func play() {
        
        self.updateQuestion()
        self.updateRound()
        self.updateDisqualifications()
        self.updateProgressBarRound()
        

}
    
    private func updateQuestion() {
        
        let url = URL(string:gameHandler.getPresidentPicture() ?? "")
        famousImage.kf.setImage(with: url)
        
        let quentios = gameHandler.getAnswers()
        topLeftBtn.setTitle(quentios?[0], for: [])
        topRightBtn.setTitle(quentios?[1], for: [])
        leftButtomBtn.setTitle(quentios?[2], for: [])
        rightButtomBtn.setTitle(quentios?[3], for: [])
        
    }
    
    private func updateRound() {
        self.round.text = "\(gameHandler.getRound())/15"
        
    }
    
    private func updateDisqualifications() {
        self.disqualifications.text = "x\(gameHandler.disqualifications)"
        
    }
    
    private func updateProgressBarRound() {
        self.progressBarRound.setProgress(gameHandler.roundInProgressBar, animated: false)
        
        
        
    }
    
    @IBAction func pressedQuestion(_ sender: UIButton) {
       let isCurrentAnswer = gameHandler.isCurrentAnswer(answer: sender.title(for: []))
                
        changeColorAccornigAnswer(isCurrentAnswer , sender)
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 ) { [self] in
            
            if(self.gameHandler.disqualifications > 0 && !self.gameHandler.isGameEnd()) {
                self.requestChangeQuestion()
                sender.tintColor = UIColor.systemOrange
            }else {
                self.gameHandler.UpdateRecord()
                self.dismiss(animated: true , completion: nil)
                
            }
                
        
         }
    
        }
        
    
    private func requestChangeQuestion(){
        
        self.gameHandler.moveNextQuestion()
        self.updateQuestion()
        self.updateRound()
        self.updateDisqualifications()
        self.updateProgressBarRound()
        
        
    }
    
    func closeGame()  {
        
    }
    
    
    func changeColorAccornigAnswer(_ isCurrect: Bool ,_ sender: UIButton) {
        if(isCurrect) {
        
            sender.tintColor = UIColor.green
        }else {
            
            sender.tintColor = UIColor.red
        }
        
    }
    
   

}

