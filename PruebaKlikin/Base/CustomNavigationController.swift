//
//  CustomNavigationController.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import UIKit

final class CustomNavigationController: UINavigationController {

    // Here we have to create and instantiate the rootViewController
    static let instance = CustomNavigationController(rootViewController: ShopsListViewController.initAndLoad())

    private override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        // Configure Navigation Controller appearance
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.setNavigationBarHidden(true, animated: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureWindow() -> UIWindow {
        // Create a window that is the same size as the screen
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.rootViewController = self
        // Show the window
        window.makeKeyAndVisible()

        return window
    }

    func navigate(to destination: UIViewController, animated: Bool, closePreviousVC: Bool = false) {
        if let topViewController = UIApplication.topViewController(controller: self), let nav = topViewController.navigationController {
            nav.pushViewController(destination, animated: animated)
            if closePreviousVC {
                if let index = nav.viewControllers.firstIndex(of: destination), index > 0 {
                    nav.viewControllers.removeSubrange(0..<index)
                }
            }

        } else {
            self.pushViewController(destination, animated: animated)
            if closePreviousVC {
                if let index = self.viewControllers.firstIndex(of: destination), index > 0 {
                    self.viewControllers.removeSubrange(0..<index)
                }
            }
        }
    }

    func present(to destination: UIViewController, animated: Bool, presentationStyle: UIModalPresentationStyle = .overCurrentContext, completion: (() -> Void)? = nil) {
        if let topViewController = UIApplication.topViewController(controller: self) {
            destination.modalPresentationStyle = presentationStyle
            topViewController.present(destination, animated: animated, completion: completion)
        } else {
            destination.modalPresentationStyle = presentationStyle
            self.present(destination, animated: animated, completion: completion)
        }
    }

    func dismissVC(animated: Bool, completion: (() -> Void)? = nil) {
        if let topViewController = UIApplication.topViewController(controller: self) {
            if topViewController.isModal() {
                topViewController.dismiss(animated: animated, completion: completion)
            } else {
                topViewController.navigationController?.popViewController(animated: animated)
                completion?()
            }
        } else {
            self.popViewController(animated: animated)
            completion?()
        }
    }
}
