//
//  Genre.swift
//  regames
//
//  Created by Egi Wibowo on 20/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import Foundation

struct Genre: Identifiable, Codable {
     var id: Int
     let name: String
     let slug: String
       
        private enum CodingKeys : String, CodingKey {
           case id, name, slug
        }
       
       static var example : Genre {
           Genre(id: 0, name: "Adventure", slug: "adventure")
       }
    
}
