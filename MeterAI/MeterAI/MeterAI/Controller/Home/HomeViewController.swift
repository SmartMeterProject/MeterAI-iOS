//
//  HomeViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 28.01.2023.
//

import UIKit
import OneSignal

class HomeViewController: UIViewController {
    
    var homeViewModel: HomeViewModel?
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    var currentPage = 0
    @IBOutlet weak var priceInfoStackView: UIStackView!


    var meterInfos : [UserMeter] = [UserMeter]()
    
    
    private lazy var priceInfoview : PriceInfoView = {
        let view = PriceInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceInfoview2 : PriceInfoView = {
        let view = PriceInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceInfoview3 : PriceInfoView = {
        let view = PriceInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func customInit(){
        homeViewModel = HomeViewModel(meterInfoService: MeterInfoAPIManager(), deviceService: DeviceAPIManager())
        homeViewModel?.output = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
        configure()
        homeViewModel?.getMeterInfo()
        homeViewModel?.updateDevice()
       
        
       
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            if accepted {
                if let pushToken = OneSignal.getDeviceState()?.userId {
                    // pushToken'i kullanarak bildirim gönderme işlemlerini gerçekleştirin
                    print("OneSignal Push Token: \(pushToken)")
                }
            } else {
                print("Kullanıcı bildirimleri kabul etmedi.")
            }
        })
        
    }
    
    
    private func configure(){
        configureCollectionView()
        configureNavigationBar()
        configureLayout()
    }
    
    private func getSlides(){
        mainCollectionView.reloadData()
        setPriceInfoCell(slideType: meterInfos[0].meterType)
    }
    
    private func configureLayout(){
        priceInfoStackView.addArrangedSubview(priceInfoview)
        priceInfoStackView.addArrangedSubview(priceInfoview2)
       
        
        NSLayoutConstraint.activate([
            priceInfoview.heightAnchor.constraint(equalToConstant: 120),
            priceInfoview2.heightAnchor.constraint(equalToConstant: 120),
          
        ])
    }
    
    
    @IBAction func tappedNextButton(_ sender: Any) {
    }
    
    private func configureNavigationBar(){
        title = "Anasayfa"
        navigationController?.configureNavigationForBase()
    }
    
    private func configurePriceInfo(){
       
    }
    
    
    private func configureCollectionView(){
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meterInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        
        cell.delegate = self
        cell.currentPage = indexPath.row
        cell.configureCell(meterInfos[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: mainCollectionView.contentOffset, size: mainCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = mainCollectionView.indexPathForItem(at: visiblePoint) {
            guard let cell = mainCollectionView.cellForItem(at: visibleIndexPath) as? HomeCollectionViewCell else {return}
            setPriceInfoCell(slideType : cell.slideType)
        }
    }
    
    private func setPriceInfoCell(slideType : MeterType){
        
        let meterInfo : UserMeter = meterInfos.filter({$0.meterType == slideType})[0]
        priceInfoview.configureTexts(title: "Tüketim Miktarı m3", subTitle: meterInfo.consumptionAmount)
        priceInfoview2.configureTexts(title: "Ay Sonu Beklenen Fatura Miktarı", subTitle: meterInfo.endOfMonthForecast ?? "Gönlünden Ne Koparsa")
        
        
        
        /*switch slideType {
        case .gas:
            let meterInfo : UserMeter = meterInfos.filter({$0.meterType == .gas})[0]
            priceInfoview.configureTexts(title: "Tüketim Miktarı m3", subTitle: meterInfo.consumptionAmount)
            priceInfoview2.configureTexts(title: "Ay Sonu Beklenen Fatura Miktarı", subTitle: meterInfo.endOfMonthForecast ?? "Gönlünden Ne Koparsa")
           print("gas")
        case .electric:
            let meterInfo : UserMeter = meterInfos.filter({$0.meterType == .electric})[0]
            priceInfoview.configureTexts(title: "Tüketim Miktarı m3", subTitle: meterInfo.consumptionAmount)
            priceInfoview2.configureTexts(title: "Ay Sonu Beklenen Fatura Miktarı", subTitle: meterInfo.endOfMonthForecast ?? "Gönlünden Ne Koparsa")
            print("electric")
        case .water:
            let meterInfo : UserMeter = meterInfos.filter({$0.meterType == .water})[0]
            priceInfoview.configureTexts(title: "Tüketim Miktarı m3", subTitle: meterInfo.consumptionAmount)
            priceInfoview2.configureTexts(title: "Ay Sonu Beklenen Fatura Miktarı", subTitle: meterInfo.endOfMonthForecast ?? "Gönlünden Ne Koparsa")
            print("water")
        }*/
    }

    
    
    
    
}

extension HomeViewController : HomeCollectionViewCellDelegate {
    func setPageControl(type: MeterType) {
        print(type)
    }

}


extension HomeViewController : HomeViewModelOutput {
    func getMeterInfoOutput(result: Result<MeterInfoResponse, Error>) {
        switch result {
        case .success(let response):
            self.meterInfos = response.userHouses[0].userMeters
            getSlides()
        case .failure(let error):
            print(error)
        }
    }
    

}
