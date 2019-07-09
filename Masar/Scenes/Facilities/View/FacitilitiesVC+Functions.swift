//
//  FacitilitiesVC+Functions.swift
//  Masar
//
//  Created by Sarah Gamal on 7/9/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import UIKit

extension FacilitiesVC {
    
    func setupRefreshController() {
        refreshControl.addTarget(self, action: #selector(didRefreshData), for: .valueChanged)
        refreshControl.tintColor = .white
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let label = NSAttributedString(string: "pull to refresh", attributes: attributes)
        refreshControl.attributedTitle = label
    }
    
    @objc func didRefreshData() {
        presenter.refreshData()
        currentPage = 1
    }
}
