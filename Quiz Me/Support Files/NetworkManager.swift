//
//  NetworkManager.swift
//  Quiz Me
//
//  Created by Admin on 8/30/22.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getCategories(completion : @escaping (Category) -> Void) {
        let urlString = "https://the-trivia-api.com/api/categories"
        guard let url = URL(string: urlString) else {
            print("something")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            do {
                let decorder = JSONDecoder()
                let results = try decorder.decode(Category.self, from: data)
                completion(results)
            } catch {
                return
            }
        }
        task.resume()
    }

    func getQuestion(categoryName : String , completion : @escaping ([Question]) -> Void) {
        let urlString = "https://the-trivia-api.com/api/questions?categories=\(categoryName)&limit=10&difficulty=easy"
        
        guard let url = URL(string: urlString) else {
            print("something")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {
                return
            }
            do {
                let decorder = JSONDecoder()
                let results = try decorder.decode([Question].self, from: data)
                completion(results)
            } catch {
                return
            }
        }
        task.resume()
    }
}
