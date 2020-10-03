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
    lazy var service = HomeService()
    
    var data: HomeModel?
    
    var viewDelagate: HomeViewModelViewDelegate?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        fetchData()
    }
    
    func fetchData() {
        service.fetchDataFromAPI { (data, error) in
            if data != nil {
                self.data = data
            } else {
                self.viewDelagate?.didFetchDataFailFromAPI(sender: self)
            }
        }
    }
}
