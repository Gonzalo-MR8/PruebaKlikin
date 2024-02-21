//
//  CategoryCell.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 21/2/24.
//

import UIKit
import CustomUIKitItems

class CategoryCell: UICollectionViewCell {

  @IBOutlet private weak var viewBackground: CIView!
  @IBOutlet private weak var imageViewIcon: UIImageView!
  @IBOutlet private weak var labelCategory: UILabel!

  func configure(category: Category, isSelected: Bool) {
    viewBackground.backgroundColor = isSelected ? Colors.blue20.value : Colors.white100.value

    switch category {
    case .beauty:
      imageViewIcon.tintColor = Colors.yellow100.value
      imageViewIcon.image = UIImage(named: "Truck_white")
      labelCategory.textColor = Colors.yellow100.value
      labelCategory.text = "Beauty"
    case .directSales:
      imageViewIcon.tintColor = Colors.yellow100.value
      imageViewIcon.image = UIImage(named: "Payment_Regulated_Parking_white")
      labelCategory.textColor = Colors.yellow100.value
      labelCategory.text = "Direct Sales"
    case .electricStation:
      imageViewIcon.tintColor = Colors.blue100.value
      imageViewIcon.image = UIImage(named: "Electric Scooter_white")
      labelCategory.textColor = Colors.blue100.value
      labelCategory.text = "Electric Station"
    case .food:
      imageViewIcon.tintColor = Colors.yellow100.value
      imageViewIcon.image = UIImage(named: "Catering_white")
      labelCategory.textColor = Colors.yellow100.value
      labelCategory.text = "Food"
    case .gasStation:
      imageViewIcon.tintColor = Colors.orange100.value
      imageViewIcon.image = UIImage(named: "EES_white")
      labelCategory.textColor = Colors.orange100.value
      labelCategory.text = "Gas Station"
    case .leisure:
      imageViewIcon.tintColor = Colors.blue100.value
      imageViewIcon.image = UIImage(named: "Leisure_white")
      labelCategory.textColor = Colors.blue100.value
      labelCategory.text = "Leisure"
    case .shopping:
      imageViewIcon.tintColor = Colors.yellow100.value
      imageViewIcon.image = UIImage(named: "Cart_white")
      labelCategory.textColor = Colors.yellow100.value
      labelCategory.text = "Shopping"
    }
  }
}
