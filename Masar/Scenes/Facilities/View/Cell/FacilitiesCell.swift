//
//  FacilitiesCollectionViewCell.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import UIKit
import Kingfisher

final class FacilitiesCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupContainerView()
    }
    
    func setupContainerView() {
        containerView.round(radius: 8, maskToBounds: true, clipsToBounds: true)
    }
}

extension FacilitiesCell: FacilitiesCellPresentable {
    func configure(item: Facility) {
        titleLabel.text = item.title
        categoryImageView.kf.indicatorType = .activity
        categoryImageView.kf.setImage(with: URL(string: item.image ?? "")!)
        detailsLabel.attributedText = item.description?.htmlToAttributedString
    }
    
}
