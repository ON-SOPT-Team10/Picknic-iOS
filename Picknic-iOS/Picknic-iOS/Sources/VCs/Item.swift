//
//  Item.swift
//  Picknic-iOS
//
//  Created by ✨EUGENE✨ on 2020/11/18.
//

import UIKit

struct Item {
    var title: String
    var subtitle: String
    var imageName: String
    var bookmark: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
