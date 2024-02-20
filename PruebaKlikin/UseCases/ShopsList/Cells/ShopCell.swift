//
//  ShopCell.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 20/2/24.
//

import UIKit
import CustomUIKitItems

class ShopCell: UITableViewCell {

  @IBOutlet private weak var viewHeader: CIView!
  @IBOutlet private weak var imageViewCategory: UIImageView!
  @IBOutlet private weak var imageViewShop: CIImageView!
  @IBOutlet private weak var labelTitle: UILabel!
  @IBOutlet private weak var labelOpeningHours: UILabel!

  func configure(shop: Shop) {
    imageViewShop.setImage(with: shop.photo)
    labelTitle.text = shop.name
    labelOpeningHours.text = shop.openingHours

    switch shop.category {
    case .beauty:
      viewHeader.backgroundColor = Colors.yellow100.value
      imageViewCategory.image = UIImage(named: "Truck_white")
    case .directSales:
      viewHeader.backgroundColor = Colors.yellow100.value
      imageViewCategory.image = UIImage(named: "Payment_Regulated_Parking_white")
    case .electricStation:
      viewHeader.backgroundColor = Colors.blue100.value
      imageViewCategory.image = UIImage(named: "Electric Scooter_white")
    case .food:
      viewHeader.backgroundColor = Colors.yellow100.value
      imageViewCategory.image = UIImage(named: "Catering_white")
    case .gasStation:
      viewHeader.backgroundColor = Colors.orange100.value
      imageViewCategory.image = UIImage(named: "EES_white")
    case .leisure:
      viewHeader.backgroundColor = Colors.blue100.value
      imageViewCategory.image = UIImage(named: "Leisure_white")
    case .shopping:
      viewHeader.backgroundColor = Colors.yellow100.value
      imageViewCategory.image = UIImage(named: "Cart_white")
    }
  }
}
