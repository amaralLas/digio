//
//  HomeViewModelTest.swift
//  Teste DigioTests
//
//  Created by Leonardo Amaral Sousa on 05/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import XCTest
@testable import Teste_Digio

class HomeViewModelTest: XCTestCase {
    
    var viewModel: HomeViewModel!
    
    override func setUp() {
        viewModel = HomeViewModel()
        viewModel.service = HomeServiceSucessMock()
    }

    override func tearDown() {
        viewModel = nil
    }
    
    func testCarregarDados() {
        let expectation = self.expectation(description: "fetchData")
        viewModel.fetchData()
        expectation.fulfill()
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(viewModel.products)
    }
}
