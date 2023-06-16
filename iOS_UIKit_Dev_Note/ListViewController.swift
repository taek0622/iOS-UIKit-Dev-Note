//
//  ListViewController.swift
//  iOS_UIKit_Dev_Note
//
//  Created by 김민택 on 2023/06/09.
//

import UIKit

class ListViewController: UICollectionViewController {

    // MARK: - Property

    private enum Section: CaseIterable {
        case menuList
    }

    private let menuCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String>
    {
        cell, indexPath, item in
        var content = cell.defaultContentConfiguration()

        content.text = item
        cell.contentConfiguration = content
    }

    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, String> = {
        return UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) { collectionView, indexPath, item in
            return collectionView.dequeueConfiguredReusableCell(using: self.menuCellRegistration, for: indexPath, item: item)
        }
    }()

    // MARK: - Life Cycle

    init() {
        super.init(collectionViewLayout: UICollectionViewCompositionalLayout.list(using: UICollectionLayoutListConfiguration(appearance: .plain)))
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applySnapshot()
    }

    // MARK: - Method

    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()

        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(["Old", "New"], toSection: .menuList)

        dataSource.apply(snapshot)
        
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = dataSource.itemIdentifier(for: indexPath) {
            if indexPath == [0, 0] {
                navigationController?.pushViewController(LegacyUIButtonViewController(), animated: true)
            } else {
                navigationController?.pushViewController(NewUIButtonViewController(), animated: true)
            }
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}
