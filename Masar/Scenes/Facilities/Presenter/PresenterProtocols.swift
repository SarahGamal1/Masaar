//
//  PresenterProtocols.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

protocol FacilitiesCellPresentable: class {
    func configure(item: Facility)
}

protocol FacilitiesPresentation: class {
    var isPaginating: Bool { get set}
    func reloadData()
    func endRefreshing()
    func showActivityIndicator()
    func hideActivityIndicator()
    func didFailWith(error: String)
}
