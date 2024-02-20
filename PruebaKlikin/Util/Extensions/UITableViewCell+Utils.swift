//
//  UITableViewCell+Utils.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 20/2/24.
//

import UIKit

extension UITableViewCell {
    static var nib: UINib {
        return UINib.init(nibName: String.init(describing: self), bundle: nil)
    }

    static var identifier: String {
        return String.init(describing: self)
    }
}
