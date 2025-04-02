//
//  HTTPUtility.swift
//  BlinkBox
//
//  Created by Tushar Zade on 25/11/23.
//

import Foundation

struct HTTPUtility{
    func getApiData<T: Decodable>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void){
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if (error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(T.self, from: responseData!)
                    completionHandler(result)
                }catch let error {
                    debugPrint("error occured while decoding = \(String(describing: error))")
                }
            }
        }.resume()
    }
}
