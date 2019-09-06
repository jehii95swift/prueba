//
//  Controller.swift
//  Netix
//
//  Created by Jenifer on 8/26/19.
//  Copyright © 2019 Jenifer. All rights reserved.
//

import Foundation
import UIKit

final class Controller {
    
    private let services = Services()
    
    func request(type: ShowType, category: ShowCategory, completion: @escaping ([Movie]) -> ()) {
        services.request(type: type, category: category, completion: completion)
    }
}
