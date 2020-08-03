//
//  ListGameViewModel.swift
//  regames
//
//  Created by Egi Wibowo on 19/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import Foundation
import Alamofire

class ListGameViewModel: ObservableObject {
    
    @Published var listGame : [Game] = []
    @Published var selectionNavigator: String? = nil
    
    var loading: Bool = false
    var isError: Bool = false
    
    init() {
        getListGame()
    }
    
    func goToProfile() {
        selectionNavigator = "ProfileView"
    }
    
    func getListGame() {
        let parameters = [
            "ordering": "-rating",
            "dates": "2017-01-01,2020-12-31"
        ]
        setLoading(nextStep: true)
        AF.request("https://api.rawg.io/api/games", method: .get, parameters: parameters)
            .responseDecodable (decoder: JSONDecoder(), completionHandler: { (response: DataResponse<ResponseListGame, AFError>) in
//                debugPrint(response)
                self.setLoading(nextStep: false)
                switch response.result {
                    case .success(let value):
                        self.listGame = value.results
                    case .failure(let error):
                        print(error)
                        self.setError(nextStep: true)
                }
                
        })
//       listGame = [Game.example, Game.example, Game.example]
    }
    
    func setLoading(nextStep: Bool) {
        loading = nextStep
    }
    
    func setError(nextStep: Bool) {
        isError = nextStep
    }
    
}
