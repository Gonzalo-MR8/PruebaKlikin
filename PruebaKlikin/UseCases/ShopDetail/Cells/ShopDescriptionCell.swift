//
//  ShopDescriptionCell.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 23/2/24.
//

import UIKit

class ShopDescriptionCell: UITableViewCell {

  @IBOutlet private weak var labelDescription: UILabel!

  func configure(description: String) {
    labelDescription.text = description

    if description.isEmpty {
      self.isHidden = true
    }
  }
}
