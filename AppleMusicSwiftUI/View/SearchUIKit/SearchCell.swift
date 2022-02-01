//
//  SearchCell.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 01.02.2022.
//

import UIKit

protocol ConfiguringCell {
    static var id: String { get }
    func configuring(with searchCell: SearchCategory)
}

class SearchCell: UICollectionViewCell, ConfiguringCell {
    static var id: String = "SearchCell"

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.layer.zPosition = 0
        return imageView
    }()

        let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .label
        label.layer.zPosition = 1
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [imageView, name])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 120),
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -40),
            name.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

    }

    // Обязательный init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configuring(with searchCell: SearchCategory) {
        imageView.image = UIImage.init(named: searchCell.imageName)
        name.text = searchCell.title
    }
}
