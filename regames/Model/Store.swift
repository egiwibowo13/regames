//
//  Store.swift
//  regames
//
//  Created by Egi Wibowo on 20/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import Foundation

struct Store: Identifiable, Codable {
    var id: Int
    let name: String
    let slug: String
    
    private enum CodingKeys : String, CodingKey {
        case id, name, slug
    }
    
    static var example : Store {
        Store(id: 0, name: "Apple AppStore", slug: "apple-appstore")
    }
}

struct StoreItem: Identifiable, Codable {
    var id = UUID()
    let store: Store
    
    private enum CodingKeys : String, CodingKey {
        case store
    }
    
    static var example : StoreItem {
        StoreItem(store: Store.example)
       }
}
