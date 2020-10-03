//
//  HomeModel.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 02/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
    
    struct Spotlight: Codable {
        var name: String?
        var description: String?
        var bannerURL: String?
    }
    
    struct Product: Codable {
        var name: String?
        var description: String?
        var imageURL: String?
    }
    
    struct Cash: Codable {
          var title: String?
          var description: String?
          var bannerURL: String?
      }
}
