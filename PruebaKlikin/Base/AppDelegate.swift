//
//  AppDelegate.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = CustomNavigationController.instance.configureWindow()

    return true
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    let urlString = url.absoluteString

    if urlString.starts(with: "ptklikin://detalle/") {
      let id = urlString.replacingOccurrences(of: "ptklikin://detalle/", with: "")

      UserDefaults.standard.shopId = Int(id)
      NotificationCenter.default.post(name: .DeepLinkCall, object: nil, userInfo: ["id": Int(id) ?? ""])
    }

    return true
  }
}

