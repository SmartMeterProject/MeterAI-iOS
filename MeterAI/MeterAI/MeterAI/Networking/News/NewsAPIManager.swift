//
//  NewsAPIManager.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 5.06.2023.
//

import Foundation


protocol NewsService {
    func getNews(completion: @escaping (Result<NewsResponse, Error>) -> Void)
}


struct NewsAPIManager : NewsService {
    func getNews(completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        
        let newsRequest = NewsRequest()
        newsRequest.execute { response in
            completion(.success(response))
        } onError: { error in
            completion(.failure(error))
        }
    }
}
