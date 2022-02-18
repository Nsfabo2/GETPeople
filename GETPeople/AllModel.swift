//
//  AllModel.swift
//  GETPeople
//
//  Created by Najla on 11/01/2022.
//

import Foundation

class AllModel{
    
    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        let url = URL(string: "https://swapi.dev/api/films/?format=json")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
    
    
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        let url = URL(string: "https://swapi.dev/api/people/?format=json")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
}
