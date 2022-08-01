//
//  FeedUploadModel.swift
//  Estagram
//
//  Created by 이민섭 on 2022/05/24.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult? 
}

struct FeedUploadResult : Decodable{
    var postIdx : Int? 
}

