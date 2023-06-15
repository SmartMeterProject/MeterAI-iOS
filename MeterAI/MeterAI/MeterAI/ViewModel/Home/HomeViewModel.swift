//
//  HomeViewModel.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 5.06.2023.
//

import Foundation

protocol HomeViewModelOutput : AnyObject {
    func getMeterInfoOutput(result : Result <MeterInfoResponse, Error>)
}


class HomeViewModel {
    
    private let meterInfoService : MeterInfoService
    private let deviceService : DeviceService
    weak var output : HomeViewModelOutput?
    
    init(meterInfoService : MeterInfoService, deviceService : DeviceService){
        self.meterInfoService = meterInfoService
        self.deviceService = deviceService
    }
    
    func getMeterInfo(){
        meterInfoService.getMeterInfo {[weak self] response in
            guard let strongSelf = self else {return}
            strongSelf.output?.getMeterInfoOutput(result : response)
        }
    }
    
    func updateDevice(){
        DispatchQueue.main.async { [weak self]  in
            self?.deviceService.updateDevice { result in}
        }
    }
    
    
}
