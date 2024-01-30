//
//  TMDBAPIManager.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import Foundation
import Alamofire

class TMDBAPIManager {
    static let shared = TMDBAPIManager()
    
    func fetchTrendingMovie(completionHandler: @escaping (TrendingModel) -> Void) {
        let url = "https://api.themoviedb.org/3/trending/tv/week?language=ko-KR"
        
        let header: HTTPHeaders = ["Authorization": APIKey.tmdb]
        
        AF.request(url, headers: header).responseDecodable(of: TrendingModel.self) { response in
            switch response.result {
            case .success(let success):
//                print(success)
                completionHandler(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

//    
//    func fetchTrendingMovie() {
//        let url = "https://api.themoviedb.org/3/trending/tv/week?language=ko-KR"
//        
//        let header: HTTPHeaders = ["Authorization": APIKey.tmdb]
//        
//        AF.request(url, headers: header).responseDecodable(of: TrendingModel.self) { response in
//            switch response.result {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure.localizedDescription)
//            }
//        }
//    }
//    
}
