//
//  CollectionViewController.swift
//  sopt33-third-seminar
//
//  Created by 윤희슬 on 2023/10/28.
//

import UIKit

class CollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
    }
    
    private func setLayout() {
            self.view.addSubview(collectionView)
            collectionView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
            $0.backgroundColor = .black
        }
    
    private func setCollectionViewConfig() {
            self.collectionView.register(ImageCollectionViewCell.self,
                                         forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    
    private func setCollectionViewLayout() {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
            flowLayout.minimumLineSpacing = 3
            flowLayout.minimumInteritemSpacing = 3
            self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
        }

}

extension CollectionViewController: UICollectionViewDelegate {}
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                            for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: imageCollectionList[indexPath.row])
        return item
    }
}

