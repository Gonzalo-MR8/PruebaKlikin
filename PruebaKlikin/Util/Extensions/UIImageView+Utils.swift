//
//  UIImageView+Utils.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 20/2/24.
//

import UIKit

extension UIImageView {
  func setImage(with imageUrlString: String?, placeholderImage: UIImage? = UIImage(named: "placeholder"), completion: ((UIImage?) -> Void)? = nil) {
    DispatchQueue.main.async {
      self.image = placeholderImage
    }

    ImageDownloader.shared.downloadImage(with: imageUrlString, placeholderImage: placeholderImage) { image in
      DispatchQueue.main.async {
        self.image = image
        completion?(image)
      }
    }
  }
}
