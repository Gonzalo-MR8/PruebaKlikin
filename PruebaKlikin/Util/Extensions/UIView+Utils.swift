//
//  UIView+Utils.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 23/2/24.
//

import UIKit

extension UIView {
  func setupNib() {
    let contentView = loadViewFromNib()
    contentView.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(contentView)

    contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

  }

  fileprivate func loadViewFromNib() -> UIView {
      let bundle = Bundle(for: type(of: self))
      let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
      guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else { return UIView() }

      return view
  }
}
