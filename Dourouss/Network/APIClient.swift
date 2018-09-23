//
//  APIClient.swift
//  Dourouss
//
//  Created by Moustapha Kebe on 23/09/2018.
//  Copyright © 2018 KEBE. All rights reserved.
//


import Foundation

typealias KhassidaJSON = [String: Any]

struct APIClient {
    
    static func getKhassidasAPI(completion: @escaping (KhassidaJSON?) -> Void) {
        
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/50/explicit.json")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as? KhassidaJSON
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}

