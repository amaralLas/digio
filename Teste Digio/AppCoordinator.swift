//
//  AppCoordinator.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 02/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
    var navController: UINavigationController { get }
    var childrenCoordinator: [CoordinatorProtocol] { get }
    
    func start()
}

class AppCoordinator: CoordinatorProtocol {
        
    var navController: UINavigationController
    
    var childrenCoordinator: [CoordinatorProtocol] = []
    
    init(navigation: UINavigationController) {
        self.navController = navigation
    }
    
    func start() {
        let vm = HomeViewModel()
        let vc = HomeViewController(viewModel: vm)
        vm.viewDelagate = vc
        navController.pushViewController(vc, animated: true)
    }
}
