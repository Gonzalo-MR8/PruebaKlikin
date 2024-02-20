//
//  ShopsListViewController.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import UIKit

class ShopsListViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  private var viewModel: ShopsListViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    self.viewModel = ShopsListViewModel()

    configureTable()

    Task {
      do {
        try await self.viewModel.callShops()
        tableView.reloadData()
      } catch {
        CustomNavigationController.instance.showAlertView(title: "Error", message: "Ha ocurrido un error inesperado", buttonText: "Vale")
      }
    }
  }

  private func configureTable() {
    tableView.register(ShopCell.nib, forCellReuseIdentifier: ShopCell.identifier)
  }
}

// MARK: - UITableViewDataSource

extension ShopsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.getShops().count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let shop: Shop = viewModel.getShops()[indexPath.row]

    guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopCell.identifier) as? ShopCell else { return UITableViewCell() }

    cell.configure(shop: shop)

    return cell
  }
}
