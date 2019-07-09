//
//  FacilitiesVC+PresenterDelegate.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import UIKit
import SVProgressHUD

extension FacilitiesVC: FacilitiesPresentation {
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()  
    }
    
    func showActivityIndicator() {
        if currentPage == 1 {
            SVProgressHUD.show(withStatus: "Loading.. ")
        }
    }
    
    func hideActivityIndicator() {
        SVProgressHUD.dismiss()
    }
        
    func didFailWith(error: String) {
        AlertBuilder(title: "Fail", message: error, preferredStyle: .alert)
            .addAction(title: "try Agian", style: .default) {
                [weak self] in
                guard let self = self else { return }
                self.presenter.getData(page: 1)
            }
            .addAction(title: "cancel", style: .cancel)
            .build()
            .show()
    }
}

