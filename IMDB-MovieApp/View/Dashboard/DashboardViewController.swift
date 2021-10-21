//
//  ViewController.swift
//  IMDB-MovieApp
//
//  Created by Gilang Sinawang on 20/10/21.
//

import UIKit
import Toast_Swift

class DashboardViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentStackView: UIStackView!
  @IBOutlet weak var spotlightMoviesCollectionView: UICollectionView!
  @IBOutlet weak var moviesTableView: UITableView!
  
  let service = Networking()
  var movies: [MovieListItem] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    getMovieList()
  }
  
  private func setupCollectionView(){
    spotlightMoviesCollectionView.dataSource = self
    spotlightMoviesCollectionView.delegate = self
    spotlightMoviesCollectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.cellIdentifier)
    
    moviesTableView.dataSource = self
    moviesTableView.delegate = self
    moviesTableView.isScrollEnabled = false
    moviesTableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.cellIdentifier)
  }
  
  private func getMovieList(){
    service.getCategories { [weak self] response in
      switch response{
      case .success(let data):
        self?.movies = data
        DispatchQueue.main.async {
          self?.spotlightMoviesCollectionView.reloadData()
          self?.moviesTableView.reloadData()
        }
      case .failure(let error):
        self?.view.makeToast(error.localizedDescription)
      }
    }
  }
  
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.cellIdentifier, for: indexPath) as! MovieCollectionViewCell
    let model = movies[indexPath.row]
    cell.configure(viewModel: model)
    return cell
  }
  
  
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 300, height: 450)
  }
}


extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellIdentifier, for: indexPath) as! MovieTableViewCell
    let model = movies[indexPath.row]
    cell.configure(viewModel: model)
    return cell
  }
  
  
}
