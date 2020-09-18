//
//  APIClient.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import Foundation

enum APIError: String {
  case invalidResponse = "Invalid response"
  case noData = "No Data"
  case failedRequest = "Failed Request"
  case invalidData = "Invalid Data"
}

class APIClient {
    
    private static let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json")
    
    static func albumData(completion: @escaping (RSSFeed?, APIError?) -> Void) {
        guard let url = url else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          DispatchQueue.main.async {
            guard error == nil else {
                completion(nil, .failedRequest)
                return
            }
            
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil, .failedRequest)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let rssFeedData: RSSFeed = try decoder.decode(RSSFeed.self, from: data)
                completion(rssFeedData, nil)
            } catch {
                completion(nil, .invalidData)
            }
          }
        }.resume()
        
    }
    
    static func loadImage(imageURL: String, completionHandler: @escaping (Data?, APIError?) -> Void) {
        guard let url = URL(string: imageURL) else {
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                guard let data = data else {
                    completionHandler(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                completionHandler(data, nil)
            }
        }).resume()
    }
    
}
