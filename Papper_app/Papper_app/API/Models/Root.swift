//
//  Root.swift
//  Papper_app
//
//  Created by Comedian Augusta on 9/18/21.
//  Copyright © 2021 Cheloveknikitaa. All rights reserved.
//

import Foundation

struct Root: Codable {
    let urls: ur
    struct ur: Codable {
        let full: URL
        let raw: URL
    }
}
