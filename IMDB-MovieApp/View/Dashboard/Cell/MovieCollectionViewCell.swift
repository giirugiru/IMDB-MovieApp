//
//  MovieCollectionViewCell.swift
//  IMDB-MovieApp
//
//  Created by Gilang Sinawang on 20/10/21.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var bgView: UIView!
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  static let cellIdentifier = String(describing: MovieCollectionViewCell.self)
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    bgView.layer.cornerRadius = 20
  }
  
  static func nib() -> UINib {
    return UINib(nibName: cellIdentifier, bundle: nil)
  }
  
  public func configure(viewModel: MovieListItem){
    if let title = viewModel.title, let rating = viewModel.imDbRating {
      nameLabel.text = "\(title) - \(rating)"
    }
    if let url = viewModel.image {
      posterImageView.kf.setImage(with: URL(string: url))
    }
  }
  
}
