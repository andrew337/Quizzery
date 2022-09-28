//
//  Category.swift
//  Quiz Me
//
//  Created by Admin on 8/30/22.
//

import Foundation

struct Categories : Codable {
    let categories : [String : [String]]
}

struct Category : Codable {
    let artsLiterature : [String]
    let filmTV : [String]
    let foodDrink : [String]
    let generalKnowledge : [String]
    let geography : [String]
    let history : [String]
    let music : [String]
    let science : [String]
    let societyCulture : [String]
    let sportLeisure : [String]
    
        
    
    enum CodingKeys : String, CodingKey {
        case artsLiterature = "Arts & Literature"
        case filmTV = "Film & TV"
        case foodDrink = "Food & Drink"
        case generalKnowledge = "General Knowledge"
        case geography = "Geography"
        case history = "History"
        case music = "Music"
        case science = "Science"
        case societyCulture = "Society & Culture"
        case sportLeisure = "Sport & Leisure"
    }
}
