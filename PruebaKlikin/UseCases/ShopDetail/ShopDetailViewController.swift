//
//  ShopDetailViewController.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 23/2/24.
//

import UIKit

enum ShopDetailCellType: Equatable {
  case headerImage
  case map
  case info
  case description
}

class ShopDetailViewController: UIViewController {

  @IBOutlet private weak var labelName: UILabel!
  @IBOutlet private weak var tableView: UITableView!

  private var shop: Shop!
  private let cellTypes: [ShopDetailCellType] = [.headerImage, .map, .info, .description]

  static func initAndLoad(shop: Shop) -> ShopDetailViewController {
    let shopDetailViewController = ShopDetailViewController.initAndLoad()

    shopDetailViewController.shop = shop

    return shopDetailViewController
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    configure()
    configureTableView()
  }

  private func configure() {
    labelName.text = shop.name
  }

  private func configureTableView() {
    tableView.register(HeaderImageCell.nib, forCellReuseIdentifier: HeaderImageCell.identifier)
    tableView.register(MapCell.nib, forCellReuseIdentifier: MapCell.identifier)
    tableView.register(InfoCell.nib, forCellReuseIdentifier: InfoCell.identifier)
    tableView.register(ShopDescriptionCell.nib, forCellReuseIdentifier: ShopDescriptionCell.identifier)
  }

  @IBAction func buttonBackPressed(_ sender: Any) {
    CustomNavigationController.instance.dismissVC(animated: true)
  }
}

// MARK: - UITableViewDataSource

extension ShopDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    cellTypes.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellType: ShopDetailCellType = cellTypes[indexPath.row]

    switch cellType {
    case .headerImage:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderImageCell.identifier) as? HeaderImageCell else { return UITableViewCell() }

      return cell
    case .map:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: MapCell.identifier) as? MapCell else { return UITableViewCell() }

      cell.configure(shop: shop)
      
      return cell
    case .info:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier) as? InfoCell else { return UITableViewCell() }

      cell.configure(shop: shop)

      return cell
    case .description:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopDescriptionCell.identifier) as? ShopDescriptionCell else { return UITableViewCell() }

      cell.configure(description: shop.openingHours)

      return cell
    }
  }
}
