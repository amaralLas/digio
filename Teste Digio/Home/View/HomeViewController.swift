//
//  ViewController.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 02/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var helloUser: UILabel!
    @IBOutlet weak var spotlightListView: UICollectionView!
    @IBOutlet weak var imgCash: UIImageView!
    @IBOutlet weak var produtosListView: UICollectionView!
    
    var viewModel: HomeViewModel?
    
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
        self.produtosListView.dataSource = self
        self.produtosListView.delegate = self
        self.spotlightListView.dataSource = self
        self.spotlightListView.delegate = self
        if let vm = viewModel {
            imgUser.kf.setImage(with: URL(string: vm.user_img))
        }
        
        registerNibProducts()
        registerNibSpotlight()
    }
    
    func registerNibProducts() {
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        produtosListView?.register(nib, forCellWithReuseIdentifier: "produto")
        if let flowLayout = self.produtosListView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func registerNibSpotlight() {
        let nib = UINib(nibName: "SpotlightCellCollectionViewCell", bundle: nil)
        spotlightListView?.register(nib, forCellWithReuseIdentifier: "spotlight")
        if let flowLayout = self.spotlightListView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
}

extension HomeViewController: HomeViewModelViewDelegate {
    func didFetchDataFromAPISucces(sender: HomeViewModel) {
        produtosListView.reloadData()
        spotlightListView.reloadData()
    }
    
    func showCashBanner(sender: HomeViewModel, bannerUrl: String) {
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        self.imgCash.kf.setImage(with: URL(string: bannerUrl), options: [.processor(processor)])
    }
    
    func didFetchDataFromAPIFail(sender: HomeViewModel) {
        let alert = UIAlertController(title: "Error", message: "Tivemos problema para obter os detalhes do servidor", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView  == produtosListView {
            return viewModel?.products?.count ?? 0
        } else {
            return viewModel?.spotlight?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == produtosListView {
             guard let item = viewModel?.products?[indexPath.row] else { return UICollectionViewCell() }
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "produto", for: indexPath) as? ProductCell {
                cell.setup(item: item)
                return cell
            }
        } else {
               guard let item = viewModel?.spotlight?[indexPath.row] else { return UICollectionViewCell() }
               if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spotlight", for: indexPath) as? SpotlightCellCollectionViewCell {
                   cell.setup(item: item)
                return cell
               }
        }
         return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == produtosListView {
            return CGSize(width: 200, height: 200)
        }
        return CGSize(width: 370, height: 200)
    }
}
