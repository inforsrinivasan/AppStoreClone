//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Srinivasan Rajendran on 2021-08-20.
//

import UIKit

final class SearchResultCell: UICollectionViewCell {

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos and Videos"
        return label
    }()

    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.2M"
        return label
    }()

    lazy var screenshotImage1: UIImageView = {
        return self.getImageView
    }()

    lazy var screenshotImage2: UIImageView = {
        return self.getImageView
    }()

    lazy var screenshotImage3: UIImageView = {
        return self.getImageView
    }()

    let getButon: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let labelsStackView = VerticalStackView(arrangedSubviews: [
            nameLabel,
            categoryLabel,
            ratingsLabel
        ])

        let infoTopStackView = UIStackView(arrangedSubviews: [
            imageView,
            labelsStackView,
            getButon
        ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center

        let bottomImagesStackView = UIStackView(arrangedSubviews: [
            screenshotImage1,
            screenshotImage2,
            screenshotImage3
        ])
        bottomImagesStackView.distribution = .fillEqually
        bottomImagesStackView.spacing = 12

        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView,
            bottomImagesStackView
        ], spacing: 16)

        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16,
                                               left: 16,
                                               bottom: 16,
                                               right: 16))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var getImageView: UIImageView {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        return iv
    }
}
