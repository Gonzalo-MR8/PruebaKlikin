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
      labelCategory.text = "Belleza"
    case .directSales:
      imageViewIcon.tintColor = Colors.yellow100.value
      imageViewIcon.image = UIImage(named: "Payment_Regulated_Parking_white")
      labelCategory.textColor = Colors.yellow100.value
      labelCategory.text = "Venta directa"
    case .electricStation:
      imageViewIcon.tintColor = Colors.blue100.value
      imageViewIcon.image = UIImage(named: "Electric Scooter_white")
      labelCategory.textColor = Colors.blue100.value
      labelCategory.text = "Carga eléctrica"
    case .food:
      imageViewIcon.tintColor = Colors.yellow100.value
      imageViewIcon.image = UIImage(named: "Catering_white")
      labelCategory.textColor = Colors.yellow100.value
      labelCategory.text = "Comida"
    case .gasStation:
      imageViewIcon.tintColor = Colors.orange100.value
      imageViewIcon.image = UIImage(named: "EES_white")
      labelCategory.textColor = Colors.orange100.value
      labelCategory.text = "Gasolinera"
    case .leisure:
      imageViewIcon.tintColor = Colors.blue100.value
      imageViewIcon.image = UIImage(named: "Leisure_white")
      labelCategory.textColor = Colors.blue100.value
      labelCategory.text = "Ocio"
    case .shopping:
      imageViewIcon.tintColor = Colors.yellow100.value
      imageViewIcon.image = UIImage(named: "Cart_white")
      labelCategory.textColor = Colors.yellow100.value
      labelCategory.text = "Compras"
    }
  }
}
