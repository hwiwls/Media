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
    
    func fetchTVSeries(api: TMDBAPI, completionHandler: @escaping (TVSeriesModel) -> Void) {
        AF.request(
            api.endpoint,
            method: api.method,
            parameters: api.parameter,
            headers: api.header
        ).responseDecodable(of: TVSeriesModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchSeriesDetail(api: TMDBAPI, completionHandler: @escaping (DetailModel) -> Void) {
        AF.request(
            api.endpoint,
            method: api.method,
            parameters: api.parameter,
            headers: api.header
        ).responseDecodable(of: DetailModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchSeriesCast(api: TMDBAPI, completionHandler: @escaping (CastModel) -> Void) {
        AF.request(
            api.endpoint,
            method: api.method,
            parameters: api.parameter,
            headers: api.header
        ).responseDecodable(of: CastModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func fetchRecommendedSeries(api: TMDBAPI, completionHandler: @escaping (RecommendModel) -> Void) {
        AF.request(
            api.endpoint,
            method: api.method,
            parameters: api.parameter,
            headers: api.header
        ).responseDecodable(of: RecommendModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
