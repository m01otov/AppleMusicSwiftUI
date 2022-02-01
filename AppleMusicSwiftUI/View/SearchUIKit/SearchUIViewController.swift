//
//  SearchUIViewController.swift
//  AppleMusicSwiftUI
//
//  Created by Ilya Melnikov on 01.02.2022.
//

import UIKit

struct Section: Hashable {
    let id = UUID()
    let title = "Поиск по категориям"
}

class SearchUIViewController: UIViewController{

    private let searchController = UISearchController(searchResultsController: nil)
    private var collectionView: UICollectionView! = nil

    private var dataSource: UICollectionViewDiffableDataSource<Section, SearchCategory>?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createSearchLayout())
        view.addSubview(collectionView)

        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.id)

        configureSearchController()
        setupNavigation()
        createDataSource()
        reloadData()
    }

    private func configureSearchController() {
             searchController.loadViewIfNeeded()
             searchController.searchResultsUpdater = self
             searchController.searchBar.delegate = self
             searchController.obscuresBackgroundDuringPresentation = false
             searchController.searchBar.enablesReturnKeyAutomatically = false
             searchController.searchBar.returnKeyType = UIReturnKeyType.done
             self.navigationItem.searchController = searchController
             self.navigationItem.hidesSearchBarWhenScrolling = false
             definesPresentationContext = true
             searchController.searchBar.placeholder = "Ваша медиатека"
         }

    private func setupNavigation() {
             navigationItem.title = "Поиск"
             navigationController?.navigationBar.prefersLargeTitles = true
             view.backgroundColor = .systemBackground
         }

    func configure<T: ConfiguringCell>(_ cellType: T.Type, with searchCategory: SearchCategory, for indexPath: IndexPath) -> T {
             guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.id,
                                                                 for: indexPath
             ) as? T else {
                 fatalError()
             }
        cell.configuring(with: searchCategory)
             return cell
         }

    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, SearchCategory>(collectionView: collectionView) { collectionView, indexPath, searchCategory in
            return self.configure(SearchCell.self, with: searchCategory, for: indexPath)
        }
        dataSource?.supplementaryViewProvider = {collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier , for: indexPath

            )as? SectionHeader else {
                return nil
            }
            sectionHeader.title.text = "Поиск по категориям"
            return sectionHeader
        }
    }

    func reloadData() {
             var snapshot = NSDiffableDataSourceSnapshot<Section, SearchCategory>()
             snapshot.appendSections([Section()])
             snapshot.appendItems(searchList, toSection: nil)

             dataSource?.apply(snapshot)
         }

    func createSearchLayout() -> UICollectionViewLayout {
             let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                 let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 2), heightDimension: .fractionalHeight(1))

                 let item = NSCollectionLayoutItem(layoutSize: itemSize)
                 item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)

                 let group = NSCollectionLayoutGroup.horizontal(
                     layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(135)),
                     subitems: [item, item]
                 )

                 let section = NSCollectionLayoutSection(group: group)
                 section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
                 section.boundarySupplementaryItems = [self.createSectionHeader()]

                 return section
             }
             return layout
         }
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
             let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(35))
             let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
             return layoutSectionHeader
         }
}

extension SearchUIViewController: UISearchResultsUpdating, UISearchBarDelegate {
     func updateSearchResults(for searchController: UISearchController) {

     }
 }
