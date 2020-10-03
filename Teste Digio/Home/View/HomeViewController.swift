//
//  ViewController.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 02/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var viewModel: HomeViewModel?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
       super.init(coder: coder)
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
}

extension HomeViewController: HomeViewModelViewDelegate {
    func didFetchDataFailFromAPI(sender: HomeViewModel) {
        let alert = UIAlertController(title: "Error", message: "Tivemos problema para obter os detalhes do servidor", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
