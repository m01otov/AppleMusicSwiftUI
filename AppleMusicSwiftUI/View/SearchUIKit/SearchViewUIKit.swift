//
//  SearchViewUIKit.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 01.02.2022.
//

import SwiftUI
import UIKit

struct SearchViewUI: UIViewControllerRepresentable {

     func makeUIViewController(context: Context) -> UIViewController {
         let searchViewController = SearchUIViewController()
         let searchNavigationController = UINavigationController(rootViewController: searchViewController)

         return searchNavigationController
     }

     func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

     }
 }
