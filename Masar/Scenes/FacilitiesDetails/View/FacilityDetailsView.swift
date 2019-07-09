//
//  FacilityDetailsView.swift
//  Masar
//
//  Created by Sarah Gamal on 7/9/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import UIKit


final class FacilityDetailsView: UIView {
    
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var requiredDocumentsLabel: UILabel!
    @IBOutlet private weak var prerequisitesLabel: UILabel!
    @IBOutlet private weak var feesLabel: UILabel!
    @IBOutlet private weak var timeFrameLabel: UILabel!
    @IBOutlet private weak var serviceChannelLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var policiesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupContainerView()
    }
    
    private func setupContainerView() {
        containerView.round(radius: 8, maskToBounds: true, clipsToBounds: true)
    }
    
    func configure(item: Facility) {
        categoryImageView.kf.indicatorType = .activity
        categoryImageView.kf.setImage(with: URL(string: item.image ?? "")!)
        detailsLabel.attributedText = item.description?.htmlToAttributedString
        requiredDocumentsLabel.attributedText = item.requiredDocuments?.htmlToAttributedString
        prerequisitesLabel.attributedText = item.prerequisites?.htmlToAttributedString
        feesLabel.attributedText = item.fees?.htmlToAttributedString
        timeFrameLabel.attributedText = item.timeFrame?.htmlToAttributedString
        serviceChannelLabel.attributedText = item.serviceChannels?.htmlToAttributedString
        policiesLabel.attributedText = item.policiesAndProcedures?.htmlToAttributedString
    }
    
}
