//
//  NYTimesAPI.swift
//  NYTimesAssignment
//
//  Created by Vikas Singh on 08/08/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

typealias JSON = Any
typealias JSONArray = [JSON]
typealias JSONObject = [String: JSON]

@objc public class NYTimesAPI: NSObject {
    
    @objc static let sharedInstance = NYTimesAPI()
    
    private let sessionManager: URLSession = {
        let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
        return URLSession(configuration: urlSessionConfiguration, delegate: nil, delegateQueue: nil)
    }()
    
    class UrlComponents {
        let path: String
        let baseUrlString = Constant.baseUrlString
        let apiKey = Constant.apiKey
        let searchQuery: String?
        
        
        var url: URL {
            var query = [String]()
            
            query.append("api-key=\(apiKey)")
            
            guard let composedUrl = URL(string: "?" + query.joined(separator: "&"), relativeTo: NSURL(string: baseUrlString + path + "?") as URL?) else {
                fatalError("Unable to build request url")
            }
            return composedUrl
        }
        
        init(path: String, query: String? = nil) {
            self.path = path
            guard var query = query else {
                self.searchQuery = nil
                return
            }
            
            query = query.replacingOccurrences(of: " ", with: "+")
            self.searchQuery = query
        }
    }
    
    
    @objc open func fetchFeaturedArticles(completion: @escaping ([MostPopularArticle]) -> ()) {
        let urlComponents = UrlComponents(path: Constant.path)
        let request = URLRequest(url: urlComponents.url)
        
        sessionManager.dataTask(with: request) { (data, response, error) in
            
            //TODO: Handle error case
            guard error == nil else {
                print("Error : \(String(describing: error?.localizedDescription))")
                return
            }
            
            var configuredArticles = [MostPopularArticle]()
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                if let dictionary = json as? JSONObject,
                    let articles = dictionary["results"] as? JSONArray {
                    for article in articles {
                        if let article = article as? JSONObject,
                            let featuredArticle = try? MostPopularArticle(json: article) {
                            configuredArticles.append(featuredArticle)
                        }
                    }
                    completion(configuredArticles)
                }
            }
            }.resume()
    }
}
    

enum APIError : LocalizedError {
    case noData
    case networkError(underlyingError:Error)
    case serializationError(underlyingError:Error)
    
    public var errorDescription: String? {
        switch self {
        case .noData:
            return "Error when server is missing content"
        case let .networkError(underlyingError: error):
            return error.localizedDescription
        case .serializationError(underlyingError: _):
            return "Error related to format of the data"
        }
    }
}
    

