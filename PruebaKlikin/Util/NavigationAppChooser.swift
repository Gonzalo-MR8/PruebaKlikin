//
//  NavigationAppChooser.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 24/2/24.
//

import UIKit
import CoreLocation
import MapKit

public enum NavigationAppChooser {
    case AppleMaps
    case GoogleMaps
    case Waze

    public var appname: String {
        switch self {
            case .AppleMaps:
            return "Apple Maps"
            case .GoogleMaps:
            return "Google Maps"
            case .Waze:
            return "Waze"
        }
    }
    public var baseUrl: String {
        switch self {
            case .AppleMaps:
            return "http://maps.apple.com"
            case .GoogleMaps:
            return "comgooglemaps://"
            case .Waze:
            return "waze://"
        }
    }

    public static let allApps: [NavigationAppChooser] = [.AppleMaps, .GoogleMaps, .Waze]
    public static var availableApps: [NavigationAppChooser] {
        return self.allApps.filter { app in app.available }
    }

    public var url: URL? {
        return URL(string: self.baseUrl)
    }

    public var available: Bool {
        guard let url = self.url else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }

    public func directionsUrlString(coordinate: CLLocationCoordinate2D, name: String = "Destino") -> String {

        var urlString = self.baseUrl

        switch self {
            case .AppleMaps:
            urlString.append("?q=\(coordinate.latitude),\(coordinate.longitude)=d&t=h")

            case .GoogleMaps:
            urlString.append("?saddr=&daddr=\(coordinate.latitude),\(coordinate.longitude)&directionsmode=driving")

            case .Waze:
            urlString.append("?ll=\(coordinate.latitude),\(coordinate.longitude)&navigate=yes")
        }

        let urlwithPercentEscapes =
                urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString

        return urlwithPercentEscapes
    }

    public func directionsUrl(coordinate: CLLocationCoordinate2D, name: String = "Destino") -> URL? {
        let urlString = self.directionsUrlString(coordinate: coordinate, name: name)
        return URL(string: urlString)
    }

    //open the app
    public func openWithDirections(coordinate: CLLocationCoordinate2D,
                                   name: String = "Destino",
                                   completion: ((Bool) -> Swift.Void)? = nil) {

        // Apple Maps can be opened differently than other navigation apps
        if self == .AppleMaps {
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = name

            let success = mapItem.openInMaps(launchOptions:
                [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])

            completion?(success)
        }

        guard let url = self.directionsUrl(coordinate: coordinate, name: name) else {
            completion?(false)
            return
        }

      UIApplication.shared.open(url, options: [:], completionHandler: {
          (success) in
          completion?(success)
      })
    }

    // present available apps
    public static func directionsAlertController(coordinate: CLLocationCoordinate2D,
                                                 name: String = "Destino",
                                                 title: String = "Navegar al destino",
                                                 message: String? = nil,
                                                 completion: ((Bool) -> ())? = nil)
            -> UIAlertController {

        let directionsAlertView = UIAlertController(title: title,
                message: nil,
                preferredStyle: .actionSheet)

        for navigationApp in NavigationAppChooser.availableApps {

            let action = UIAlertAction(title: navigationApp.appname,
                    style: UIAlertAction.Style.default,
                handler: { action in
                    navigationApp.openWithDirections(coordinate: coordinate,
                            name: name,
                            completion: completion)
                })

                directionsAlertView.addAction(action)
        }

        let cancelAction = UIAlertAction(title: "Cancelar",
                style: UIAlertAction.Style.cancel,
                handler: { action in completion?(false) })

        directionsAlertView.addAction(cancelAction)

        return directionsAlertView
    }
}
