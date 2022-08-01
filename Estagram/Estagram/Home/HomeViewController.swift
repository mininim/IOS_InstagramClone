//
//  HomeViewController.swift
//  Estagram
//
//  Created by 이민섭 on 2022/05/02.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
   

    @IBOutlet weak var tableView: UITableView!
    var arrayCat : [FeedModel] = []
    
    let imagePickerViewController = UIImagePickerController() // 카메라, 앨범의 뷰 컨트롤러
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self //  테이블 뷰: UITableView delegate
        tableView.dataSource = self
        tableView.separatorStyle = .none
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)          //hoemwview에 feedtableviewcell 등록
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        // Do any additional setup after loading the view.
        let input = FeedAPIInput(limit: 30, page: 10)
        FeedDataManager().feedDataManager(input, self)
        
        imagePickerViewController.delegate = self
        
    }
    
    @IBAction func buttonGoAlbum(_ sender: Any) {
        self.imagePickerViewController.sourceType = .photoLibrary // 앨범을 선택, 카메라로 넘어갈 수도 있게 할 수 있음
        self.present(imagePickerViewController, animated: true, completion:  nil)
    }
    
    
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource { // 테이블뷰 델리 게이트
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 변수명과 상관 없이 tableView deledate, DataSource에서 정의된 함수임
        return arrayCat.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell // 첫번째는 story cell 로
            else {
                return UITableViewCell()
            }
            return cell
        }else{ // 이후에는 feed Cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
                return UITableViewCell()
            }
            if let urlString = arrayCat[indexPath.row - 1].url{
                let url = URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 80
        }else{
        return 600
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? StoryTableViewCell else{
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegat(dataSourceDelegate: self, forRow: indexPath.row)
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { // 컬렉션 뷰 10개
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else{
            return UICollectionViewCell() // 기본 셀
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
        
        
}

extension HomeViewController{
    func successAPI(_ result : [FeedModel]){
        arrayCat = result
        tableView.reloadData()
    }
}

extension HomeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let imageString = "gs://catstargram-d7bf.appsot.com/Cat"
            let input = FeedUploadInput(content: "저희 나비 귀엽지 않나요?", postImgsURL: [imageString])
            FeedUploadDataManager().posts(self, input)
            
        
        }
    }
}


