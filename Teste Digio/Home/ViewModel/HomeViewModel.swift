//
//  HomeViewModel.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 02/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

protocol HomeViewModelViewDelegate {
    func didFetchDataFromAPISucces(sender: HomeViewModel)
    func didFetchDataFromAPIFail(sender: HomeViewModel)
    func showCashBanner(sender: HomeViewModel, bannerUrl: String)
}

class HomeViewModel {
    
    weak var coordinator: AppCoordinator?
    lazy var service:HomeServiceProtocol = HomeService()
    
    let user_img = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTw4xIzlTTRJKIQB1tq1Jbs5Rfj7hU6h1UtPg&usqp=CAU"
    
    let user_hello = "Olá, Maria"
    
    var spotlight: [HomeModel.Spotlight]?
    var products: [HomeModel.Product]? 
    var cash: HomeModel.Cash? {
        didSet {
            if let url = cash?.bannerURL {
                viewDelagate?.showCashBanner(sender: self, bannerUrl: url)
            }
        }
    }
    
    var viewDelagate: HomeViewModelViewDelegate?
    
    func fetchData() {
        service.fetchDataFromAPI { (data, error) in
            if let data = data {
                self.spotlight = data.spotlight
                self.products = data.products
                self.cash = data.cash
                self.viewDelagate?.didFetchDataFromAPISucces(sender: self)
            } else {
                self.viewDelagate?.didFetchDataFromAPIFail(sender: self)
            }
        }
    }
}
