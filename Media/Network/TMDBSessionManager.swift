//
//  TMDBSessionManager.swift
//  Media
//
//  Created by hwijinjeong on 2/5/24.
//

import Foundation

enum CustomError: Error {
    case failedRequest
    case noData
    case invalidResponse
    case invalidData
}


class TMDBSessionManager {
    static let shared = TMDBSessionManager()
    
    private init() { }
    
    func fetchSeriesDetailS(id: Int, completionHandler: @escaping (DetailModel?, CustomError?) -> Void) {
        var url = URLRequest(url: TMDBAPI.detail(id: id).endpoint)
        url.httpMethod = "GET"
        url.addValue(APIKey.tmdb, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    print("통신 실패")
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                guard let data = data else {
                    print("통신은 성공했지만, 데이터가 안 옴")
                    completionHandler(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    print("응답값이 오지 않음")
                    completionHandler(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    print("통신은 성공했지만, 올바른 값이 오지 않은 상태")
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(DetailModel.self, from: data)
                    completionHandler(result, nil)
                } catch {
                    print(error)
                    completionHandler(nil, CustomError.invalidData)
                }
            }
        }.resume()
    }
    
    
    
}
