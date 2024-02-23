//
//  Double+Utils.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 22/2/24.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
