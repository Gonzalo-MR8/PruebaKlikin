//
//  ShopsListViewController.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import UIKit

class ShopsListViewController: UIViewController {

  @IBOutlet private weak var labelNumberOfShops: UILabel!
  @IBOutlet private weak var labelNumberOfShopsOrderPerDistance: UILabel!
  @IBOutlet private weak var labelDistance: UILabel!
  @IBOutlet private weak var collectionView: UICollectionView!
  @IBOutlet private weak var tableView: UITableView!

  private let kCategories: [Category] = [.gasStation, .food, .leisure, .beauty, .directSales, .electricStation, .shopping]

  private var viewModel: ShopsListViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    CustomNavigationController.instance.showHudView()

    self.viewModel = ShopsListViewModel()

    configureTableAndCollectionViews()

    Task {
      do {
        try await self.viewModel.callShops()
        tableView.reloadData()
        labelNumberOfShops.text = viewModel.getShops().count.description
        CustomNavigationController.instance.closeHudView()
      } catch {
        CustomNavigationController.instance.showAlertView(title: "Error", message: "Ha ocurrido un error inesperado", buttonText: "Vale")
        CustomNavigationController.instance.closeHudView()
      }
    }

    LocationManager.shared.requestLocationPermission()
  }

  private func configureTableAndCollectionViews() {
    collectionView.register(CategoryCell.nib, forCellWithReuseIdentifier: CategoryCell.identifier)
    tableView.register(ShopCell.nib, forCellReuseIdentifier: ShopCell.identifier)
  }
}

// MARK: - UICollectionViewDataSource

extension ShopsListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    kCategories.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let category = kCategories[indexPath.row]

    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }

    cell.configure(category: category, isSelected: category == viewModel.getSelectedCategory() ? true : false)

    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension ShopsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      viewModel.categorySelected(category: kCategories[indexPath.row])
      tableView.reloadData()
      collectionView.reloadData()
      labelNumberOfShops.text = viewModel.getShops().count.description
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ShopsListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.frame.width / 2.5, height: 66)
  }
}

// MARK: - UITableViewDataSource

extension ShopsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.getShops().count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let shop: Shop = viewModel.getShop(index: indexPath.row)
    let distance = shop.location.location.distance(from: LocationManager.shared.lastUserLocation)
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ShopCell.identifier) as? ShopCell else { return UITableViewCell() }

    cell.configure(shop: shop, distance: distance)

    if distance < 1000 {
      labelDistance.text = "A menos de 1 km"
      labelNumberOfShopsOrderPerDistance.text = viewModel.getNumberOfShopsPerDistance(distance: 1).description
    } else {
      let distanceKm = distance / 1000
      let rounderKm = Int(ceil(distanceKm))
      labelNumberOfShopsOrderPerDistance.text = viewModel.getNumberOfShopsPerDistance(distance: rounderKm).description
      labelDistance.text = "A menos de \(rounderKm) km"
    }

    return cell
  }
}

// MARK: - UITableViewDelegate

extension ShopsListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let shopDetailVC = ShopDetailViewController.initAndLoad(shop: viewModel.getShop(index: indexPath.row))

    CustomNavigationController.instance.navigate(to: shopDetailVC, animated: true)
  }
}
