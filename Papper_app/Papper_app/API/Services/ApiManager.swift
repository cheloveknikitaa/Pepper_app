//
//  ApiManager.swift
//  Papper_app
//
//  Created by Comedian Augusta on 9/18/21.
//  Copyright © 2021 Cheloveknikitaa. All rights reserved.
//

import Foundation

enum ApiType {
    case getRandom
    
    var baseUrl: String {
        return "https://api.unsplash.com/"
    }
    
    var path: String {
        return "photos/random/?client_id=YOUR_TOKEN"
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseUrl)!)!
        let request = URLRequest(url: url)
        return request
    }
}

class ApiManager {
    
    static let shared = ApiManager()
    
    func getRandom(completion: @escaping (Root) -> Void) {
        let request = ApiType.getRandom.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let decode = JSONDecoder()
            let root = try! decode.decode(Root.self, from: data!)
            print(root.urls.raw)
            completion(root)
        }
        task.resume()
    }
    
}
