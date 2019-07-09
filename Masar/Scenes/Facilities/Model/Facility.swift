//
//  Facility.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import Foundation

struct Facility: Decodable {
    let id: Int?
    let title: String?
    let `description`: String?
    let image: String?
    let prerequisites: String?
    let requiredDocuments: String?
    let fees: String?
    let timeFrame: String?
    let serviceChannels: String?
    let policiesAndProcedures: String?
    
    private enum CodingKeys: String, CodingKey {
        case id                = "ID"
        case title             = "Title"
        case `description`     = "Description"
        case image             = "ImageSrc"
        case prerequisites     = "Prerequisites"
        case requiredDocuments = "RequiredDocuments"
        case fees              = "Fees"
        case timeFrame         = "TimeFrame"
        case serviceChannels   = "ServiceChannels"
        case policiesAndProcedures = "PoliciesAndProcedures"
    }
}
