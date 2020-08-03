//
//  DetailsGameViewModel.swift
//  regames
//
//  Created by Egi Wibowo on 21/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import Foundation
import Alamofire

class DetailsGameViewModel: ObservableObject {
    
    @Published var game : Game? = nil
    @Published var similarGames : [Game] = []
    
    @Published var selectionNavigator: String? = nil
    
    var loading: Bool = false
    var isError: Bool = false
    
    var loadingSimilarGame: Bool = false
    
    init(gameId: Int) {
        getDetailsGame(gameId: gameId)
        getSimilarGames(gameId: gameId)
    }

    
    func getDetailsGame(gameId: Int) {
        setLoading(nextStep: true)
        AF.request("https://api.rawg.io/api/games/\(gameId)", method: .get)
            .responseDecodable (decoder: JSONDecoder(), completionHandler: { (response: DataResponse<Game, AFError>) in
                self.setLoading(nextStep: false)
                switch response.result {
                    case .success(let value):
                        self.game = value
                    case .failure(let error):
                        self.setError(nextStep: true)
                }
            })
    }
    
    func getSimilarGames(gameId: Int) {
        setLoadingSimilarGame(nextStep: true)
        AF.request("https://api.rawg.io/api/games/\(gameId)/suggested", method: .get)
            .responseDecodable (decoder: JSONDecoder(), completionHandler: { (response: DataResponse<ResponseListGame, AFError>) in
                self.setLoadingSimilarGame(nextStep: false)
                switch response.result {
                    case .success(let value):
                        self.similarGames = value.results
                    case .failure(let error):
                        self.setError(nextStep: true)
                }
            })
    }
    
    func setLoading(nextStep: Bool) {
        loading = nextStep
    }
    
    func setError(nextStep: Bool) {
        isError = nextStep
    }
    
    func setLoadingSimilarGame(nextStep: Bool) {
        loadingSimilarGame = nextStep
    }
    
}
