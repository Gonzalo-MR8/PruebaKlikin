//
//  Colors.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 20/2/24.
//

import UIKit

enum Colors: String {
  case black100
  case white100
  case orange100
  case blue100
  case blue20
  case yellow100
  case darkBlue100
  case lightBlue100
  case background100
}

extension Colors {
  var value: UIColor {
    guard let color = UIColor.init(named: self.rawValue) else { return .clear }

    return color
  }
}
