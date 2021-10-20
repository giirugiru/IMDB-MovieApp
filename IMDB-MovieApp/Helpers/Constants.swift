//
//  Constants.swift
//  IMDB-MovieApp
//
//  Created by Gilang Sinawang on 20/10/21.
//

import Foundation


struct Constants {
  
  static let APIKey = "/k_doubsysa"
  
  struct APIPath {
    static let BaseAPI = "https://imdb-api.com/en/API"
    static let GetTop250Movies = BaseAPI + "/Top250Movies" + Constants.APIKey
    static let GetMovieDetail = BaseAPI + "/Title" + Constants.APIKey
  }
}
