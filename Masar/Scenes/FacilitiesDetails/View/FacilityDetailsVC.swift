//
//  FacilityDetailsVC.swift
//  Masar
//
//  Created by Sarah Gamal on 7/9/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import UIKit

final class FacilityDetailsVC: UIViewController {

    var mainView: FacilityDetailsView {
        return view as! FacilityDetailsView
    }
    
    var facility: Facility?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let facility = facility {
            title = facility.title
            mainView.configure(item: facility)
        }
    }
    
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
