//
//  Question.swift
//  Trivia App
//
//  Created by Cem Arda Ergezer on 7.07.2021.
//

import Foundation

struct Question {
//    Stores questions
    let question:String
//    Stores answers
    let answers: [String]
//    Stores correct answers
    let correctAnswer:String
    
    init(q:String, a:[String], c:String) {
        question = q
        answers = a
        correctAnswer = c
    }
}
