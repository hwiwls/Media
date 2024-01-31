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
                completionHandler(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTopRatedMovie(completionHandler: @escaping (TopRatedModel) -> Void) {
        let url = "https://api.themoviedb.org/3/tv/top_rated?language=ko-KR"
        
        let header: HTTPHeaders = ["Authorization": APIKey.tmdb]
        
        AF.request(url, headers: header).responseDecodable(of: TopRatedModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchPopularMovie(completionHandler: @escaping (PopularModel) -> Void) {
        // 한국어 지원 안 함
        let url = "https://api.themoviedb.org/3/tv/popular"
        
        let header: HTTPHeaders = ["Authorization": APIKey.tmdb]
        
        AF.request(url, headers: header).responseDecodable(of: PopularModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchSeriesDetail(id: Int, completionHandler: @escaping (DetailModel) -> Void) {
        let url = "https://api.themoviedb.org/3/tv/\(id)?language=ko-KR"
        
        let header: HTTPHeaders = ["Authorization": APIKey.tmdb]
        
        AF.request(url, headers: header).responseDecodable(of: DetailModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchSeriesDetail2(id: Int) {
        let url = "https://api.themoviedb.org/3/tv/\(id)?language=ko-KR"
        
        let header: HTTPHeaders = ["Authorization": APIKey.tmdb]
        
        AF.request(url, headers: header).responseDecodable(of: DetailModel.self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
}
