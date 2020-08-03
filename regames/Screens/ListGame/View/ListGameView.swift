//
//  ListGamesView.swift
//  regames
//
//  Created by Egi Wibowo on 19/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import SwiftUI

struct ListGamesView: View {
    
    @ObservedObject private var viewModel = ListGameViewModel()
    

    
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }

    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ProfileView(), tag: "ProfileView", selection: $viewModel.selectionNavigator) {
                    EmptyView()
                }
                if(viewModel.isError) {
                    ErrorView()
                }
                LoadingView(isShowing: .constant(viewModel.loading)) {
                    List (self.viewModel.listGame) { game in
                        ZStack {
                            CardGame(game: game )
                            NavigationLink(destination: DetailsGameView(gameId: game.id)) {
                                EmptyView()
                            }
                        }
                    }
                }
                
            }
            .navigationBarItems(trailing:
            HStack {
                Button(action: { self.viewModel.goToProfile() }) {
                    Image("user")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .leading)
                }.foregroundColor(.gray)
            })
            .navigationBarTitle("regames", displayMode: .automatic)
        }
       
    }
}

struct ListGamesView_Previews: PreviewProvider {
    static var previews: some View {
        ListGamesView()
    }
}
