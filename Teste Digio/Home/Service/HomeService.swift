//
//  HomeService.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 02/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol {
    var delegate: HomeServiceDelegate { get set }
    func fetchDataFromAPI()
}

protocol HomeServiceDelegate {
    func didFetchDataFromAPI(data: HomeModel)
    func didFetchDataFailFromAPI()
}

class HomeService: HomeServiceProtocol {
    
    let BASE_URL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com";
    var delegate: HomeServiceDelegate

    init(delegate: HomeServiceDelegate) {
        self.delegate = delegate
    }
    
    func fetchDataFromAPI() {
        AF.request("\(BASE_URL)/sandbox/products").responseString { response in
            switch response.result {
            case .success(_):
                guard let value = response.value else { return }
                guard let jsonData = value.data(using: .utf8), let homeModel = try? JSONDecoder().decode(HomeModel.self, from: jsonData) else {
                                   fallthrough
                              }
                self.delegate.didFetchDataFromAPI(data: homeModel)
                break
            case .failure(_):
                self.delegate.didFetchDataFailFromAPI()
                break
            }
        }
    }
}
