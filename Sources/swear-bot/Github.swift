//
//  File.swift
//  
//
//  Created by Joshua Button on 5/29/20.
//

import Foundation

class Github {
    private let GITHUB_URL = "https://api.github.com/search/commits?q="
    static let sharedInstance = Github()
    
    private init() {
    }
    
    func search(swearWord: String) {
        guard let url = URL(string: "\(GITHUB_URL)\(swearWord)") else { return }

        var request = URLRequest(url: url)
        request.addValue("application/vnd.github.cloak-preview", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                print(response)
                return
            }
            
            if let data = data,
                let string = String(data: data, encoding: .utf8) {
                print(string)
            }
        }
        task.resume()
    }
}
