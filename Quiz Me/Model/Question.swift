//
//  Question.swift
//  Quiz Me
//
//  Created by Admin on 9/1/22.
//

import Foundation

struct Question : Codable {
    let category : String
    let correctAnswer : String
    let incorrectAnswers : [String]
    let question : String
}
