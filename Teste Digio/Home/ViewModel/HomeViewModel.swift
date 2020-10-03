//
//  HomeViewModel.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 02/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

protocol HomeViewModelViewDelegate {
    func didFetchDataFailFromAPI(sender: HomeViewModel)
}

class HomeViewModel {
    
    weak var coordinator: AppCoordinator!
    lazy var service: HomeService = { HomeService(delegate: self)}()
    
    var data: HomeModel?
    
    var viewDelagate: HomeViewModelViewDelegate?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        fetchData()
    }
    
    func fetchData() {
        service.fetchDataFromAPI()
    }
}

extension HomeViewModel: HomeServiceDelegate {
    func didFetchDataFromAPI(data: HomeModel) {
        self.data = data
    }
    
    func didFetchDataFailFromAPI() {
        viewDelagate?.didFetchDataFailFromAPI(sender: self)
    }
}
