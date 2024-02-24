//
//  MapCell.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 23/2/24.
//

import UIKit
import MapKit

class MapCell: UITableViewCell {
  
  @IBOutlet private weak var mapView: MKMapView!

  private var shop: Shop!
  private let kMapZoom: Float = 14.0

  func configure(shop: Shop) {
    self.shop = shop
    mapView.isUserInteractionEnabled = false

    let regionRadius: CLLocationDistance = 200

    let region = MKCoordinateRegion(center: shop.location.location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    mapView.setRegion(region, animated: true)
  }

  @IBAction func bringMeHerePressed(_ sender: Any) {
    let nav = NavigationAppChooser.directionsAlertController(coordinate: shop.location.location.coordinate, name: "Llévame aquí", title: "Navegar al destino", message: "Elija la aplicación con la que desea navegar")
    CustomNavigationController.instance.present(to: nav, animated: true)
  }
}
