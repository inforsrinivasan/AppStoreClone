//
//  AppSearchController.swift
//  AppStoreClone
//
//  Created by Srinivasan Rajendran on 2021-08-20.
//

import UIKit

final class AppSearchController: UICollectionViewController,
                                 UICollectionViewDelegateFlowLayout {

    private let cellId = "appsearch"
    private var appResults = [Result]()

    // MARK: Initializers

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        fetchData()
    }

    private func fetchData() {
        APIService.shared.fetchApps { [weak self] result in
            if case let .success(searchResults) = result {
                self?.appResults = searchResults
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }

    // MARK: Collection view Data Source delegates

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        let appResult = appResults[indexPath.item]
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
        return cell
    }

    // MARK: Collection view Flow Layout delegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }

}
