//  FacilitiesVC.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import UIKit

final class FacilitiesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: FacitilitiesPresenter!
    var refreshControl = UIRefreshControl()
    var currentPage = 1
    var isPaginating = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupRefreshController()
        presenter = FacitilitiesPresenter(view: self)
        presenter.getData(page: currentPage)
        title = "Facitilies"
    }

}
