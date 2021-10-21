//
//  MovieTableViewCell.swift
//  IMDB-MovieApp
//
//  Created by Gilang Sinawang on 21/10/21.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
  
  @IBOutlet weak var posterImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  
  static let cellIdentifier = String(describing: MovieTableViewCell.self)
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  static func nib() -> UINib {
    return UINib(nibName: cellIdentifier, bundle: nil)
  }
  
  
  public func configure(viewModel: MovieListItem){
    if let title = viewModel.title, let rating = viewModel.imDbRating {
      nameLabel.text = title
      ratingLabel.text = rating
    }
    if let url = viewModel.image {
      posterImage.kf.setImage(with: URL(string: url))
    }
  }
  
}
