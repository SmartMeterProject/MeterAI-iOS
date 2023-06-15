//
//  NewsViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 4.02.2023.
//

import UIKit

class NewsViewController: UIViewController {
    var news : [NewNews] = [] {
        didSet{
            newsTableView.reloadData()
        }
    }
    
    private lazy var refreshControl = UIRefreshControl()
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        customInit()
        configureTableView()
        configureNavigationBar()
        getNews()
    }
    
    var newsViewModel : NewsViewModel?
    
    private func customInit(){
        self.newsViewModel = NewsViewModel(newsService: NewsAPIManager())
        self.newsViewModel?.output = self
    }
    
    private func processingIndicator(status : Bool){
        if status {
            indicator.startAnimating()
            self.view.isUserInteractionEnabled = false
        }else{
            indicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
        }
    }
    
    private func getNews(){
        processingIndicator(status: true)
        newsViewModel?.getNews()
    }
    
    private func configureNavigationBar(){
        title = "Haberler"
        navigationController?.configureNavigationForBase()
    }
    
    private func configureTableView(){
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.showsVerticalScrollIndicator = false
        newsTableView.showsHorizontalScrollIndicator = false
        newsTableView.backgroundColor = .clear
        newsTableView.separatorColor = .white
        //newsTableView.separatorStyle = .singleLine
        newsTableView.refreshControl = refreshControl
        newsTableView.register(with: NewsTableViewCell.className)
        configureRefreshControl()
    }
    
    
    private func configureRefreshControl(){
        refreshControl.addTarget(self, action: #selector(refreshControl(_:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = .white
    }
    
    
    @objc func refreshControl(_ refreshControl : UIRefreshControl){
        self.getNews()
    }

}


extension NewsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.configureCell(decription: news[indexPath.row].content, type: news[indexPath.row].meterType, time: "Bugün, 10:50", imageURL : news[indexPath.row].contentImagePath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.configureContent(news: self.news[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension NewsViewController : NewsViewModelOutput {
    func getNewsOutput(result: Result<NewsResponse, Error>) {
        switch result {
        case .success(let response):
            print(response.newList)
            news = response.newList
           processingIndicator(status: false)
           refreshControl.endRefreshing()
        case .failure(let error):
            print(error)
            processingIndicator(status: false)
            refreshControl.endRefreshing()
        }

    }
    
    
}
