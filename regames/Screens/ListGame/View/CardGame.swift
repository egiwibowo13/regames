//
//  CardGame.swift
//  regames
//
//  Created by Egi Wibowo on 19/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import SwiftUI

struct CardGame: View {
    var game: Game
    
    func getGenres(genres: [Genre]) -> String {
        var result: String = ""
        for genre in genres {
            result = result + genre.name + ", "
        }
        return result.dropLast().dropLast() + "."
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(game.title)
            .font(.subheadline)
            .fontWeight(.black)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(1)
            HStack(alignment: .top) {
//                Image(game.image)
//                    .resizable()
//                    .frame(width: 100, height: 100, alignment: .leading)
                ImageView(url: game.image, width: 100, height: 100)
                         
                VStack(alignment: .leading, spacing: 2) {
                    Text(game.released ?? "-")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                    RatingView(rating: game.rating)
                    GenreView(genres: getGenres(genres: game.genres))
                    StoresView(stores: game.stores)
                    
                }
            }
            }
           .padding()
           .cornerRadius(10)
           .overlay(
               RoundedRectangle(cornerRadius: 10)
                   .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
           )
    }
}

struct CardGame_Previews: PreviewProvider {
    static var previews: some View {
        CardGame(game: Game.example)
    }
}

struct RatingView: View {
    var rating: Double
    init(rating: Double) {
        self.rating = rating
    }
    var body: some View {
        HStack (alignment: .top, spacing: 2) {
            Image(rating >= 1 ? "star-active": "star-inactive")
                .resizable()
                .frame(width: 13, height: 13, alignment: .leading)
            Image(rating >= 2 ? "star-active": "star-inactive")
            .resizable()
            .frame(width: 13, height: 13, alignment: .leading)
            Image(rating >= 3 ? "star-active": "star-inactive")
            .resizable()
            .frame(width: 13, height: 13, alignment: .leading)
            Image(rating >= 4 ? "star-active": "star-inactive")
            .resizable()
            .frame(width: 13, height: 13, alignment: .leading)
            Image(rating >= 5 ? "star-active": "star-inactive")
            .resizable()
            .frame(width: 13, height: 13, alignment: .leading)
        }

    }
}

struct GenreView: View {
    var genres: String
    private let a : [Genre] = [Genre.example, Genre.example]
    init(genres: String) {
        self.genres = genres
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Genre : ")
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(.primary)
            .padding(.top, 3)
            Text(genres)
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(.secondary)
            .padding(.top, 3)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct StoresView: View {
     var stores: [StoreItem]
       init(stores: [StoreItem]) {
           self.stores = stores
       }
    
    func getStore(slug: String) -> String {
        switch slug {
        case "apple-appstore":
            return "apple-appstore"
        case "google-play":
            return "google-play"
        case "nintendo":
            return "nintendo"
        case "steam":
            return "steam"
        case "xbox-store":
            return "xbox-store"
        case "xbox360":
            return "xbox-store"
        case "itch":
            return "itch"
        case "epic-games":
            return "epic-games"
        default:
            return "apple-appstore"
        }
    }
       
       var body: some View {
           ScrollView {
            HStack(alignment: .top) {
                 Spacer()
                    ForEach(stores) { storeItem in
                        Image(self.getStore(slug: storeItem.store.slug))
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .leading)
                            .clipShape(Circle())
                    }
            }
           }.frame(height: 20, alignment: .center)
       }
}

