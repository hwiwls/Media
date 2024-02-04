//
//  TMDBAPI.swift
//  Media
//
//  Created by hwijinjeong on 2/4/24.
//

import Foundation
import Alamofire

enum TMDBAPI {
    case trend
    case topRated
    case popular
    case detail(id: Int)
    case cast(id: Int)
    case recommend(id: Int)

    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }

    var endpoint: URL {
        switch self {
        case .trend:
            return URL(string: baseURL + "trending/tv/week")!
        case .topRated:
            return URL(string: baseURL + "tv/top_rated")!
        case .popular:
            return URL(string: baseURL + "tv/popular")!
        case .detail(let id):
            return URL(string: baseURL + "tv/\(id)")!
        case .cast(let id):
            return URL(string: baseURL + "tv/\(id)/aggregate_credits")!
        case .recommend(let id):
            return URL(string: baseURL + "tv/\(id)/recommendations")!
        }
    }

    var header: HTTPHeaders {
        return ["Authorization": APIKey.tmdb]
    }

    var method: HTTPMethod {
        return .get
    }

    var parameter: Parameters {
        switch self {
        case .trend:
            ["language":"ko-KR"]
        case .topRated:
            ["language":"ko-KR"]
        case .popular:
            ["language":"ko-KR"]
        case .detail:
            ["language":"ko-KR"]
        case .cast:
            ["language":"ko-KR"]
        case .recommend:
            ["language":"ko-KR"]
        }
    }

}
