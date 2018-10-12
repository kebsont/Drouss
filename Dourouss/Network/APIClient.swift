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
        
        let url = URL(string: "http://127.0.0.1:8000/api/postings/44")
        // Put here my rest API url
        let session = URLSession.shared
        let username = "kebson"
        let password = "Toshiba05"
        let loginString = "\(username):\(password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            return
        }
        let base64LoginString = loginData.base64EncodedString()

//        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        var unwrappedURL = URLRequest(url: url!)

        unwrappedURL.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")


        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data - Look at the Server logs"); return }
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as? KhassidaJSON
                completion(responseJSON)
//                print(responseJSON?["coverImage"]!)
//                print(responseJSON?["title"]!)
//                let khassaidesJSON = try JSONDecoder().decode([Khassida].self, from: unwrappedDAta)
//                print(khassaidesJSON)
//                print("<#T##items: Any...##Any#>")
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    
        
        
        
        
//        let username = "kebson"
//        let password = "Toshiba05"
//        let loginData = String(format: "%@:%@", username, password).data(using: String.Encoding.utf8)!
//        let base64LoginData = loginData.base64EncodedString()
//
//        // create the request
//        let url = URL(string: "http://127.0.0.1:8000/api/postings/")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("Basic \(base64LoginData)", forHTTPHeaderField: "Authorization")
//
//        //making the request
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let _ = data, error == nil else {
//                print("\(String(describing: error))")
//                return
//            }
//
//            if let httpStatus = response as? HTTPURLResponse {
//                // check status code returned by the http server
//                print("response = \(httpStatus)")
//                print (response?.description)
//                // process result
//            }
//        }
//        task.resume()
//}
}

