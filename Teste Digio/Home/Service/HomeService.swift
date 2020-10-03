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
    func fetchDataFromAPI(completionHandler: @escaping(_ data: HomeModel?, _ error: String?) -> Void)
}

class HomeService: HomeServiceProtocol {
    
    let BASE_URL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com";
    
    func fetchDataFromAPI(completionHandler: @escaping(_ data: HomeModel?, _ error: String?) -> Void) {
        AF.request("\(BASE_URL)/sandbox/products").responseString { response in
            switch response.result {
            case .success(_):
                guard let value = response.value else { return }
                guard let jsonData = value.data(using: .utf8), let homeModel = try? JSONDecoder().decode(HomeModel.self, from: jsonData) else {
                                   fallthrough
                              }
                completionHandler(homeModel, nil)
                break
            case .failure(_):
                completionHandler(nil, "Erro ao tentar obter dados do servidor")
                break
            }
        }
    }
}
