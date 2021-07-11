//
//  FinalViewController.swift
//  Trivia App
//
//  Created by Cem Arda Ergezer on 7.07.2021.
//

import UIKit

class FinalViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var winnersView: UIView!
    
    var score : Int!
    
    var quizModel = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    func setupUI(){
//        1 point is earned per question and each score is worth $5
        let award = score * 5
        scoreLabel.text = "$\(award)"
//        Updating the Winner View's design
        winnersView.layer.cornerRadius = adapted(dimensionSize: 22, to: .height)
        winnersView.layer.masksToBounds = true
        
    }
    
    @IBAction func restartTapped(_ sender: UIButton) {

        presentMainPage()
    }
    
  
    
//    Returns to the question screen
    func presentMainPage() {
        let mainVC = storyboard?.instantiateViewController(identifier: "QuestionViewController") as! QuestionViewController
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .coverVertical
        present(mainVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let dest = segue.destination as! QuestionViewController
       dest.delegate = self
     }
    
}

// MARK:- Extension

extension FinalViewController:UpdateScoreLabelDelegate {
    func updateScore(with score: Int) {
        scoreLabel.text = "\(score)"
    }
    
    
}



