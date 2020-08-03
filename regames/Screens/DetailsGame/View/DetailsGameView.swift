//
//  DetailsGame.swift
//  regames
//
//  Created by Egi Wibowo on 20/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import SwiftUI

struct DetailsGameView: View {
    var gameId : Int
    @ObservedObject private var viewModel: DetailsGameViewModel
    
    init(gameId: Int) {
        self.gameId = gameId
        viewModel = DetailsGameViewModel(gameId: gameId)
    }
    
    
    func getGenres(genres: [Genre]) -> String {
        var result: String = ""
        for genre in genres {
            result = result + genre.name + ", "
        }
        return result.dropLast().dropLast() + "."
    }

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
            ImageView(url: viewModel.game?.image, width: 400, height: 200 )
            VStack(alignment: .leading, spacing: 5) {
                
                InfoGamesView(release: viewModel.game?.released ?? "-", rating: viewModel.game?.rating ?? 0, description: viewModel.game?.description ?? "-")
                SubHeadlineView(text: "Ready on")
                StoresDetailView(stores: viewModel.game?.stores ?? [])
                GenreDetailView(genres: getGenres(genres: viewModel.game?.genres ?? []))
                SubHeadlineView(text: "Similar Game")
                OtherGamesView(games: viewModel.similarGames)
                
                
            }.padding(.horizontal, 25)
            
            Spacer()
            }
        }
        .navigationBarTitle(Text(viewModel.game?.title ?? ""), displayMode: .inline)
    
    }
}

struct DetailsGameView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsGameView(gameId: 0)
    }
}

struct StoresDetailView: View {
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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                ForEach(stores) { storeItem in
                    Image(self.getStore(slug: storeItem.store.slug))
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .leading)
                        .clipShape(Circle())
                        .padding(.vertical, 3)
                }
            }
        }.frame(alignment: .leading)
    }
}

struct GenreDetailView: View {
    var genres: String
    init(genres: String) {
        self.genres = genres
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            SubHeadlineView(text: "Genre")
            Text(genres)
            .font(.caption)
            .fontWeight(.regular)
            .foregroundColor(.secondary)
            .padding(.top, 3)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct OtherGamesView: View {
     var games: [Game]
       init(games: [Game]) {
           self.games = games
       }
       
       var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment: .top) {
                ForEach(games) { game in
                    NavigationLink(destination: DetailsGameView(gameId: game.id)) {
                        ImageView(url: game.image, width: 80, height: 80 )
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.frame(alignment: .leading)
    }
}

struct SubHeadlineView: View {
    var text: String
    var body: some View {
        Text(text)
        .font(.subheadline)
        .fontWeight(.regular)
        .foregroundColor(.primary)
        .padding(.vertical, 5)
    }
}

struct InfoGamesView: View {
    var release: String
    var rating: Double
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Release Date \t: \(release)")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
            HStack(spacing: 3) {
                Text("Rating \t\t:")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
                
                RatingView(rating: rating)
            }
            
            SubHeadlineView(text: "About")
            
            Text(description)
            .font(.caption)
            .fontWeight(.regular)
            .foregroundColor(.secondary)
            .padding(.vertical, 5)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

class DetailsGameViewModelWrapper: ObservableObject {
    
}

