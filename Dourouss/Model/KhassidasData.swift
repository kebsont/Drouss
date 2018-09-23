//
//  KhassidasData.swift
//  Dourouss
//
//  Created by Moustapha Kebe on 23/09/2018.
//  Copyright © 2018 KEBE. All rights reserved.
//

import Foundation
import UIKit

final class KhassidasData {

static let sharedInstance = KhassidasData()
fileprivate init() {}

var khassidas: [Khassida] = []
var images: [UIImage] = []

func getKhassidas(completion: @escaping () -> Void) {
    
    APIClient.getKhassidasAPI { (json) in
        let feed = json?["feed"] as? KhassidaJSON
        if let results = feed?["results"] as? [KhassidaJSON] {
            for dict in results {
                let newKhassida = Khassida(dictionary: dict)
                self.khassidas.append(newKhassida)
            }
            completion()
        }
    }
}

func getKhassidasImages(completion: @escaping () -> Void) {
    getKhassidas {
        for khassaide in self.khassidas {
            let url = URL(string: khassaide.coverImage)
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                let image = UIImage(data: imageData)
                self.images.append(image!)
            }
        }
        OperationQueue.main.addOperation {
            completion()
        }
    }
}
}
