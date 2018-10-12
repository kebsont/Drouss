//
//  Khassida.swift
//  Dourouss
//
//  Created by Moustapha Kebe on 23/09/2018.
//  Copyright © 2018 KEBE. All rights reserved.
//

import Foundation

struct Khassida: Decodable {
    let id: Int!
    let name: String
    let coverImage: String
    var filePath: String?
    private enum CodingKeys: String, CodingKey {
        case id, name, coverImage = "cover_path", filePath
    }
}

struct APIResults: Decodable{
    let page: Int
    let numResults: Int
    let numPages: Int
    let khassidas: [Khassida]
    private enum CodingKeys: String, CodingKey {
        case page, numResults = "total_results", numPages = "total_pages", khassidas  = "results"
    }
}
