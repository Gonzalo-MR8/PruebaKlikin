//
//  ShopCell.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 20/2/24.
//

import UIKit

class ShopCell: UITableViewCell {

  @IBOutlet private weak var labelTitle: UILabel!

  func configure(title: String) {
    labelTitle.text = title
  }
}
