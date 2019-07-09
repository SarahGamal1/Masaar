//
//  FacilitiesPresenter.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import Foundation
import SVProgressHUD

class FacitilitiesPresenter {
    
    private weak var view: FacilitiesPresentation?
    private var backend = FacitilitiesBackendManager()

    var numberOfRows: Int { return items.count }
    private var items = [Facility]() { didSet { view?.reloadData() } }
    
    init(view: FacilitiesPresentation) {
        self.view = view
    }
    
    func getData(page: Int) {
        downloadData(page: page)
    }
    
    func refreshData() {
        items.removeAll()
        downloadData(page: 1)
    }
    
    func configureCell(cell: FacilitiesCellPresentable, with indexPath: IndexPath) {
        let item = items[indexPath.row]
        cell.configure(item: item)
    }
    
    func selectedItem(for index: Int) -> Facility {
        return items[index]
    }
    
}

// Mark:- API

private extension FacitilitiesPresenter {
    
    func downloadData(page: Int) {
        view?.showActivityIndicator()
        backend.getFacitilities(page: page) { [weak self] facilities, error in
            guard let self = self else { return }
            self.view?.hideActivityIndicator()
            self.view?.endRefreshing()
            if let error = error {
                self.view?.didFailWith(error: error.localizedDescription)
            } else if let facilities = facilities {
                self.items.append(contentsOf: facilities)
                if facilities.isEmpty {
                    self.view?.isPaginating = false
                }
            }
        }
    }
    
}

