//
//  ViewController.swift
//  IMDB-MovieApp
//
//  Created by Gilang Sinawang on 20/10/21.
//

import UIKit
import Toast_Swift

class DashboardViewController: UIViewController {

  let service = Networking()
  
  var movies: [MovieListItem] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getMovieList()
  }

  private func getMovieList(){
    service.getCategories { [weak self] response in
      switch response{
      case .success(let data):
        self?.movies = data
      case .failure(let error):
        self?.view.makeToast(error.localizedDescription)
      }
    }
  }

}

