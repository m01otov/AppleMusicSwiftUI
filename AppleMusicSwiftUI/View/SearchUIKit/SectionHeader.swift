//
//  SectionHeader.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 01.02.2022.
//

import UIKit

class SectionHeader: UICollectionReusableView {
     static let identifier = "SectionHeader"

     let separator: UIView = {
         let separator = UIView(frame: .zero)
         separator.translatesAutoresizingMaskIntoConstraints = false
         separator.backgroundColor = .quaternaryLabel
         return separator
     }()

     let title: UILabel = {
         let label = UILabel()
         label.textColor = .label
         label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
         return label
     }()

     override func prepareForReuse() {
         title.text = nil
     }

     override init(frame: CGRect) {
         super.init(frame: frame)

         let stackView = UIStackView(arrangedSubviews: [separator, title])
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.spacing = UIStackView.spacingUseSystem
         stackView.axis = .vertical
         stackView.isLayoutMarginsRelativeArrangement = true
         stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 15)
         addSubview(stackView)

         NSLayoutConstraint.activate([
             separator.heightAnchor.constraint(equalToConstant: 1),

             stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
             stackView.topAnchor.constraint(equalTo: topAnchor),
             stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
             stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
         ])
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }
