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

    func navigate(to destination: UIViewController, animated: Bool, closePreviousVC: AnyClass? = nil) {
        if let topViewController = UIApplication.topViewController(controller: self), let nav = topViewController.navigationController {
            if let closePreviousVC, getViewControllerInStack(classVC: closePreviousVC) != nil {
              nav.viewControllers.removeLast()
            }
            nav.pushViewController(destination, animated: animated)
        } else {
            if let closePreviousVC, getViewControllerInStack(classVC: closePreviousVC) != nil {
              self.viewControllers.removeLast()
            }
            self.pushViewController(destination, animated: animated)
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

  private func getViewControllerInStack(classVC: AnyClass) -> UIViewController? {
      return self.viewControllers.first(where: { type(of: $0) == classVC })
  }

  func showAlertView(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Hud View
extension CustomNavigationController {
  func showHudView() {
    closeHudView()

    DispatchQueue.main.async { [weak self] in
      guard let self else { return }

      let hudView = HudView(frame: view.frame)
      hudView.startAnimating()
      view.addSubview(hudView)
    }
  }

  func closeHudView() {
    self.view.subviews.first(where: { type(of: $0) == HudView.self })?.removeFromSuperview()
  }
}
