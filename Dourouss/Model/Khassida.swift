//
//  Khassida.swift
//  Dourouss
//
//  Created by Moustapha Kebe on 23/09/2018.
//  Copyright © 2018 KEBE. All rights reserved.
//

import Foundation

struct Khassida {
    let name: String
    let coverImage: String
    
    init(dictionary: KhassidaJSON) {
        self.name = dictionary["name"] as! String
        self.coverImage = dictionary["artworkUrl100"] as! String
    }
}
