//
//  StoryTableViewCell.swift
//  Estagram
//
//  Created by 이민섭 on 2022/05/03.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
   
    func setCollectionViewDataSourceDelegat(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int){
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        // 콜렉션 뷰에 storycollectionViewcell을 등록
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal // 스크롤 오른쪽 왼쪽으로 하도록
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        collectionView.collectionViewLayout = flowLayout
        
        
        collectionView.reloadData()
    }

        
    
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


