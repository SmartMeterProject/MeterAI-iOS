//
//  NewsViewModel.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 5.06.2023.
//

import Foundation


protocol NewsViewModelOutput : AnyObject {
    func getNewsOutput(result: Result<NewsResponse, Error>)
}

class NewsViewModel {
    
    let newsService : NewsService
    weak var output : NewsViewModelOutput?
    
    init(newsService: NewsService) {
        self.newsService = newsService
    }
    
    func getNews(){
        newsService.getNews {[weak self] result in
            guard let strongSelf = self else {return}
            strongSelf.output?.getNewsOutput(result: result)
        }
    }
    
}
