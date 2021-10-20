//
//  Networking.swift
//  IMDB-MovieApp
//
//  Created by Gilang Sinawang on 20/10/21.
//

import Foundation
import Alamofire

class Networking {
  func getCategories(completion: @escaping(AFResult<[MovieListItem]>) -> Void) {
    let url = Constants.APIPath.GetTop250Movies
    
    AF.request(url, method: .get).responseJSON { response in
      
      print("\(#function) Request: \(String(describing: response.request))")
      print("\(#function) Request method: \(String(describing: response.request?.httpMethod))")
      print("\(#function) Response: \(String(describing: response.result))")
      
      if response.error == nil {
        let data = response.data
        do {
          let APIData = try JSONDecoder().decode(MovieListWelcome.self, from: data!)
          completion(.success(APIData.items ?? []))
        } catch let error {
          print("error serializing json:", error)
          completion(.failure(.responseSerializationFailed(reason: .decodingFailed(error: error))))
        }
      } else {
        completion(.failure(response.error ?? AFError.explicitlyCancelled))
      }
    }
  }
}


