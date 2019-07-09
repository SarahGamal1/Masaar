//
//  FacitilitiesBackendManager
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire


final class FacitilitiesBackendManager {
    
    
    func getFacitilities(page: Int, completionHandler: @escaping (( [Facility]?,  Error?) -> ())) {
        
        let request = FacitilitiesRouter.getFacitilities(departmentID: 2, page: page)
        let decoder = JSONDecoder()
        Alamofire.request( request).responseDecodableObject(keyPath: "Data", decoder: decoder) {  (response:  DataResponse<[Facility]>) in
            let result = response.result
            switch result {
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}


