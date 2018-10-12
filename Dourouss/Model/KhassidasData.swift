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
//        let img = json?["coverImage"] as? Khassida
//        print(json?["coverImage"])
        let url = URL(string: json?["coverImage"] as! String )

        let title = json?["title"] as? String
        let data = try? Data(contentsOf: url!)
        print("data: ", data)
        if let imageData = data {
                print("the image & title")
            print(url!)
            print(title!)
            let image = UIImage(data: imageData)
            self.images.append(image!)
            let az = CollectionViewCell()
            az.khassidaImage.image = image
            print(self.images)
        }
        
//        for dict in title {
//                let newKhassida = Khassida(dictionary: dict)
//                self.khassidas.append(newKhassida)
//            }
//            print(self.khassidas)
            completion()
        }
    }
}
    

//func getKhassidasImages(completion: @escaping () -> Void) {
//    getKhassidas {
//        for khassaide in self.khassidas {
//            let url = URL(string: khassaide.coverImage)
//            let data = try? Data(contentsOf: url!)
//            if let imageData = data {
//                let image = UIImage(data: imageData)
//                self.images.append(image!)
//            }
//        }
//        OperationQueue.main.addOperation {
//            completion()
//        }
//    }
//}
//}
