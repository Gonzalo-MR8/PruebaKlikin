//
//  HudView.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 23/2/24.
//

import UIKit

class HudView: UIView {

  @IBOutlet weak var hudView: UIActivityIndicatorView!

  override init(frame: CGRect) {
      super.init(frame: frame)

      setupNib()
  }

  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)

      setupNib()
  }

  func startAnimating() {
    hudView.startAnimating()
  }
}
