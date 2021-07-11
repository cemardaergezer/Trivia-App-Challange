//
//  QuizModel.swift
//  Trivia App
//
//  Created by Cem Arda Ergezer on 7.07.2021.
//

import Foundation

struct QuizModel {
//    Represents what question we are in
    var questionNumber = 0
//    Number of wild cards we have
    var wildCardNumber = 2
//    The value of the score to be earned
    var score = 0

    
    let quiz = [Question(q: "Who is the founder of Apple?", a: ["Steve Jobs","Jeff Bezos","Barack Obama","Elon Musk"], c: "Steve Jobs"),
                Question(q: "Where is the capital of Turkey?", a: ["İstanbul","Ankara","İzmir","Adana"], c: "Ankara"),
                Question(q: "What is the name of the pens produced by Apple?", a: ["Kindle","iPen","Apple Pencil","iPencil"], c: "Apple Pencil"),
                Question(q: "What is the name of the cell phone produced by Apple?", a: ["ApplePhone","iNote","myApple","iPhone"], c: "iPhone"),
                Question(q: "What is the name of the app you learned how other people saved you on their phone?", a: ["GetContact","Facebook","Whatsapp","Clash of Clans"], c: "GetContact")]
    
    
    func getQuestion() -> String {
        return quiz[questionNumber].question
    }
    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    
    mutating func getQuestionNumber() -> Int {
        return questionNumber
    }
    

    mutating func getWildCardNumber() -> Int {
        return wildCardNumber
    }
    
//    Calls the score
    mutating func getScore() -> Int {
        return score
    }
    
    
//    To understand whether the question is answered correctly or incorrectly
    mutating func checkAns(selectedAnswer:String) -> Bool {
        if selectedAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        }else{
            return false
        }
    }
    
    
}
