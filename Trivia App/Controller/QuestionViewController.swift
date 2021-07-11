//
//  NewViewController.swift
//  Trivia App
//
//  Created by Cem Arda Ergezer on 10.07.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var wildCardNumberView: UIView!
    @IBOutlet weak var wildCardTitleTextLabel: UILabel!
    @IBOutlet weak var wildCardNumber: UILabel!
    
    @IBOutlet weak var questionNumberView: UIView!
    @IBOutlet weak var questionNumberTitleTextLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var questionTitleTextLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choicesView: UIView!
    
    @IBOutlet weak var choiceAView: UIView!
    @IBOutlet weak var choiceALabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    
    @IBOutlet weak var choiceBView: UIView!
    @IBOutlet weak var choiceBLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var choiceCView: UIView!
    @IBOutlet weak var choiceCLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    
    @IBOutlet weak var choiceDView: UIView!
    @IBOutlet weak var choiceDLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    
    var quizModel = QuizModel()
    var delegate: UpdateScoreLabelDelegate?
    
    
    func fontSizeUpdate(){
        wildCardTitleTextLabel.font = SF.regular(size: 14)
        wildCardNumber.font = SF.regular(size: 12)
        questionNumberTitleTextLabel.font = SF.regular(size: 14)
        questionNumberLabel.font = SF.regular(size: 12)
        questionTitleTextLabel.font = SF.semiBold(size: 17)
        questionLabel.font = SF.regular(size: 17)
        
        aLabel.font = SF.bold(size: 20)
        bLabel.font = SF.bold(size: 20)
        cLabel.font = SF.bold(size: 20)
        dLabel.font = SF.bold(size: 20)
    }
    
    
    //        Gesture recognizer
    func gestureSetup(){
        let tapAViewGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedA))
        choiceAView.addGestureRecognizer(tapAViewGesture)
        choiceAView.isUserInteractionEnabled = true
        
        let tapBViewGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedB))
        choiceBView.addGestureRecognizer(tapBViewGesture)
        choiceBView.isUserInteractionEnabled = true
        
        let tapCViewGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedC))
        choiceCView.addGestureRecognizer(tapCViewGesture)
        choiceCView.isUserInteractionEnabled = true
        
        let tapDViewGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedD))
        choiceDView.addGestureRecognizer(tapDViewGesture)
        choiceDView.isUserInteractionEnabled = true
        
    }
    
    
    
    //    The chosen answer decides whether it is true or false
    func checkSolution(answer: String, view: UIView ){
        
        let userAnsweredRight = quizModel.checkAns(selectedAnswer: answer)
        
        if userAnsweredRight {
            view.backgroundColor = UIColor.green
            nextQuestion()
        } else {
            view.backgroundColor = UIColor.red
            let alert = UIAlertController(title: "Hurry!", message: "Time is running out, use a wild card", preferredStyle: .alert)
            let usingWildCard = UIAlertAction(title: "Yes", style: .default) { [self] action in
                wildCardUsed()}
            
            let notUsingWildCard = UIAlertAction(title: "No", style: .default) { [self] action in
                presentFinalPage()}
            
            alert.addAction(usingWildCard)
            alert.addAction(notUsingWildCard)
            present(alert, animated: true, completion: nil)
        }
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureSetup()
        fontSizeUpdate()
        setupUI()
        update()
        
    }
    
    //    User interface setup
    func setupUI(){
        wildCardNumberView.layer.cornerRadius = adapted(dimensionSize: 22, to: .height)
        wildCardNumberView.layer.masksToBounds = true
        
        questionNumberView.layer.cornerRadius =  adapted(dimensionSize: 22, to: .height)
        questionNumberView.layer.masksToBounds = true
        
        questionView.layer.cornerRadius =  adapted(dimensionSize: 20, to: .height)
        questionView.layer.masksToBounds = true
        
        choicesView.layer.cornerRadius =  adapted(dimensionSize: 20, to: .height)
        choicesView.layer.masksToBounds = true
        
        choiceAView.layer.cornerRadius =  adapted(dimensionSize: 40, to: .height)
        choiceAView.layer.masksToBounds = true
        
        choiceBView.layer.cornerRadius = adapted(dimensionSize: 40, to: .height)
        choiceBView.layer.masksToBounds = true
        
        choiceCView.layer.cornerRadius = adapted(dimensionSize: 40, to: .height)
        choiceCView.layer.masksToBounds = true
        
        choiceDView.layer.cornerRadius = adapted(dimensionSize: 40, to: .height)
        choiceDView.layer.masksToBounds = true
    }
    
    //  Shows the results page after the game is over
    func presentFinalPage() {
        delegate?.updateScore(with:quizModel.score)
        let finalVC = storyboard?.instantiateViewController(identifier: "FinalViewController") as! FinalViewController
        finalVC.modalPresentationStyle = .fullScreen
        finalVC.modalTransitionStyle = .flipHorizontal
        finalVC.score = quizModel.score
        present(finalVC, animated: true, completion: nil)
        
    }
    
//    If the last question is not reached, it moves to the next question, otherwise it shows the results page
    func nextQuestion() {
        if quizModel.questionNumber + 1 < quizModel.quiz.count {
            quizModel.questionNumber += 1
        }else{
            presentFinalPage()
        }
    }
    
//    If there are any Wild-Cards available, they will be kept for use, if there are not enough, the game is over and the result page is displayed
    func wildCardUsed(){
        if quizModel.wildCardNumber > 0 {
            quizModel.wildCardNumber -= 1
        } else {
            presentFinalPage()
        }
        
        
    }
    //    MARK:- Actions
    
    @objc func update() {
        
        questionLabel.text = quizModel.getQuestion()
        
        let answerChoices = quizModel.getAnswers()
        choiceALabel.text = "\(answerChoices[0])"
        choiceBLabel.text = "\(answerChoices[1])"
        choiceCLabel.text = "\(answerChoices[2])"
        choiceDLabel.text = "\(answerChoices[3])"
        
        
        questionNumberLabel.text = "\(quizModel.getQuestionNumber() + 1)/\(quizModel.quiz.count)"
        wildCardNumber.text = "\(quizModel.getWildCardNumber())"
        
        
        choiceAView.backgroundColor = UIColor.systemGray5
        choiceBView.backgroundColor = UIColor.systemGray5
        choiceCView.backgroundColor = UIColor.systemGray5
        choiceDView.backgroundColor = UIColor.systemGray5
        
    }
    @objc func tappedA(){
        if let answer = choiceALabel.text{
            checkSolution(answer: answer, view: choiceAView)
        }
    }
    
    
    @objc func tappedB(){
        if let answer = choiceBLabel.text{
            checkSolution(answer: answer, view: choiceBView)
        }
    }
    
    @objc func tappedC(){
        if let answer = choiceCLabel.text{
            checkSolution(answer: answer, view: choiceCView)
        }
    }
    
    @objc func tappedD(){
        if let answer = choiceDLabel.text{
            checkSolution(answer: answer, view: choiceDView)
        }
    }
    
}

// MARK:- Delegate
protocol UpdateScoreLabelDelegate{
    func updateScore(with score: Int)
}
