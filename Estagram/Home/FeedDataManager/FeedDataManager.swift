//
//  FeedDataManager.swift
//  Estagram
//
//  Created by 이민섭 on 2022/05/24.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput,_ viewController : HomeViewController ){
        
        
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self){ response in
            switch response.result{
            case .success(let result):
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    
        //FeedAPIinput 형식을 보내서 [FeedModel] 형식으로 받아옴
        // 성공한 경우 성공한 값을 response에 넣어줘
        // 그리고 그 값으로 In 이후의 행동을 실행해
        
    
    
    
}
