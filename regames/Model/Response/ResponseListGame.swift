//
//  ResponseListGame.swift
//  regames
//
//  Created by Egi Wibowo on 21/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import Foundation

struct ResponseListGame: Codable {
     let results: [Game]
       
        private enum CodingKeys : String, CodingKey {
           case results
        }
    
}
