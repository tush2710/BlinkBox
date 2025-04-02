//
//  GamesViewModel.swift
//  BlinkBox
//
//  Created by Tushar Zade on 25/11/23.
//

import Foundation

protocol GamesViewModelDelegate {
    func didReceiveGamesResponse(response: GamesResponse)
}
struct GamesViewModel{
    var delegate: GamesViewModelDelegate?
    func getGames(){
        let gamesResource = GamesResource()
        gamesResource.getGames { result in
            DispatchQueue.main.async {
                if let gamesResponse = result {
                    self.delegate?.didReceiveGamesResponse(response: gamesResponse)
                }
            }
        }
    }
}
