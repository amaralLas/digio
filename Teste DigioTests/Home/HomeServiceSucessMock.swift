//
//  HomeServiceMock.swift
//  Teste DigioTests
//
//  Created by Leonardo Amaral Sousa on 05/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import Foundation
@testable import Teste_Digio

class HomeServiceSucessMock: HomeServiceProtocol {
    
    let BASE_URL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com";
    
    func fetchDataFromAPI(completionHandler: @escaping(_ data: HomeModel?, _ error: String?) -> Void) {
        let retorno = HomeModel(spotlight:[HomeModel.Spotlight(name: "Teste", description: "Teste", bannerURL: "teste")], products: [HomeModel.Product(name: "Teste", description: "Teste", imageURL: "teste")], cash: HomeModel.Cash(title: "Teste", description: "Teste", bannerURL: "Teste"))
        completionHandler(retorno, nil)
    }
}
