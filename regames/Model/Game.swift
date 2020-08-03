//
//  Game.swift
//  regames
//
//  Created by Egi Wibowo on 19/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import Foundation

struct Game: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String?
    let image: String
    let released: String?
    let rating: Double
    let stores: [StoreItem]
    let genres: [Genre]
    
    private enum CodingKeys : String, CodingKey {
        case id
        case title = "name"
        case description = "description_raw"
        case image = "background_image"
        case released
        case rating
        case stores
        case genres
    }
    
    static var example : Game {
        Game(id: 1, title: "Assasins Creed Vallhala", description: "Quae tibi placent quicunq prosunt aut diligebat multum, quod memor sis ad communia sunt ab initio", image: "flutter-app", released: "17 Nov 2020", rating: 2, stores: [StoreItem.example, StoreItem.example], genres: [Genre.example, Genre.example])
    }
}
