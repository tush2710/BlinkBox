//
//  GamesResource.swift
//  BlinkBox
//
//  Created by Tushar Zade on 25/11/23.
//

import Foundation


struct GamesResource{
    func getGames(completion: @escaping (_ result: GamesResponse?) -> Void){
        let gamesUrl = URL(string: "https://artwork.vasundharaapps.com/artwork_cache/api/AdvertiseNewApplications/17/com.fancy.fonts.style.keyboard.emojis.screen.number")!
        
        let httpUtility = HTTPUtility()
        httpUtility.getApiData(requestUrl: gamesUrl, resultType: GamesResponse.self) { result in
            completion(result)
        }
    }
}
