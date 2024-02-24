//
//  InfoCell.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 23/2/24.
//

import UIKit
import CustomUIKitItems

class InfoCell: UITableViewCell {
    
  @IBOutlet weak var imageViewIcon: CIImageView!
  @IBOutlet weak var labelName: UILabel!
  @IBOutlet weak var labelAddress: UILabel!
  @IBOutlet weak var labelCountry: UILabel!
  
  func configure(shop: Shop) {
    imageViewIcon.setImage(with: shop.photo)
    labelName.text = shop.name
    labelAddress.text = "\(shop.address.street), \(shop.address.city)"
    if let zip = shop.address.zip {
      labelAddress.text = (labelAddress.text ?? "") + ", \(zip)"
    }
    labelCountry.text = "\(shop.address.country)"
  }
}
